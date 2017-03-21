package com.mycompany.app;

import com.microsoft.azure.iothub.DeviceClient;
import com.microsoft.azure.iothub.IotHubClientProtocol;
import com.microsoft.azure.iothub.Message;
import com.microsoft.azure.iothub.IotHubStatusCode;
import com.microsoft.azure.iothub.IotHubEventCallback;
import com.microsoft.azure.iothub.IotHubMessageResult;
import com.google.gson.Gson;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Random;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;

/*
Hostname = IoTHub -> 개요 -> 호스트 이름 -> 호스트이름.azure-devices.net
SharedAccessKey = create-device-identity의 mvn exec:java -Dexec.mainClass="com.mycompany.app.App" 명령으로 얻은 값
		  Device ID: myFirstJavaDevice
		  Device key: DLRr9IUiOvf5325XzoDxLg==
*/

public class App 
{
	private static String connString = "HostName={youriothubname}.azure-devices.net;DeviceId=myFirstJavaDevice;SharedAccessKey={yourdevicekey}";
	private static IotHubClientProtocol protocol = IotHubClientProtocol.MQTT;
	private static String deviceId = "myFirstJavaDevice";
	private static DeviceClient client;
	
	private static class TelemetryDataPoint {
	   public String deviceId;
	   public double windSpeed;
	   //Added temperature, humid, dust
	   public double temperature;
	   public double humidity;
	   public double dust;

           public String serialize() {
	   Gson gson = new Gson();

	   return gson.toJson(this);
	   }
        }

	private static class EventCallback implements IotHubEventCallback
	{
	  public void execute(IotHubStatusCode status, Object context) {
	    System.out.println("IoT Hub responded to message with status: " + status.name());
	
	     if (context != null) {
	       synchronized (context) {
	       context.notify();
	      }
	    }
	  }
	}

	private static class MessageSender implements Runnable {
	  public volatile boolean stopThread = false;
	
	  public void run()  {
	    try {
	      double avgWindSpeed = 10;   // m/s
	      double avgTemperature = 8;  // c
	      double avgHumidity = 50;    // %
	      double avgDust = 64;	  // PM-10 ug/m^3 
	      Random rand = new Random();

	      while (!stopThread) {
	        double currentWindSpeed = avgWindSpeed + rand.nextDouble() * 4 - 2;
		double currentTemperature = avgTemperature + rand.nextDouble() * 6 - 3; //Added temperature sample.
		double currentHumidity = avgHumidity + rand.nextDouble() * 15 - 7;	//Added rain(humid) sample.
		double currentDust = avgDust + rand.nextDouble() * 60 - 30;		//Added dust sample.

		currentWindSpeed = (int)(currentWindSpeed * 10) / 10;
		currentTemperature = (int)(currentTemperature * 10) / 10;
		currentHumidity = (int)(currentHumidity * 10) / 10;
		currentDust = (int)(currentDust * 10) / 10;

	        TelemetryDataPoint telemetryDataPoint = new TelemetryDataPoint();
	        telemetryDataPoint.deviceId = deviceId;
	        telemetryDataPoint.windSpeed = currentWindSpeed;
		telemetryDataPoint.temperature = currentTemperature;
		telemetryDataPoint.humidity = currentHumidity;
		telemetryDataPoint.dust = currentDust;

	        String msgStr = telemetryDataPoint.serialize();
	        Message msg = new Message(msgStr);
	        System.out.println("Sending: " + msgStr);

        	Object lockobj = new Object();
	        EventCallback callback = new EventCallback();
	        client.sendEventAsync(msg, callback, lockobj);

	        synchronized (lockobj) {
	          lockobj.wait();
	        }
	        Thread.sleep(1000);
	      }
	    } catch (InterruptedException e) {
	      System.out.println("Finished.");
	    }
	  }
	}

	public static void main( String[] args ) throws IOException, URISyntaxException {
	  client = new DeviceClient(connString, protocol);
	  client.open();

	  MessageSender sender = new MessageSender();

  	  ExecutorService executor = Executors.newFixedThreadPool(1);
	  executor.execute(sender);

	  System.out.println("Press ENTER to exit.");
	  System.in.read();
	  executor.shutdownNow();
	  client.close();
	}
}
