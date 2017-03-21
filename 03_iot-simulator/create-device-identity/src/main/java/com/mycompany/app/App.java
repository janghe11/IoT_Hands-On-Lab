package com.mycompany.app;

import com.microsoft.azure.sdk.iot.service.exceptions.IotHubException;
import com.microsoft.azure.sdk.iot.service.sdk.Device;
import com.microsoft.azure.sdk.iot.service.sdk.RegistryManager;

import java.io.IOException;
import java.net.URISyntaxException;

/*
connectionString = IoTHub -> 설정 -> 공유 액세스 정책 -> iothubowner -> 공유 액세스 키 -> 연결 문자열-기본 키
*/

public class App 
{
    private static final String connectionString = "{yourhubconnectionstring}";
    private static final String deviceId = "myFirstJavaDevice";

    public static void main( String[] args ) throws IOException, URISyntaxException, Exception
    {
    	RegistryManager registryManager = RegistryManager.createFromConnectionString(connectionString);

	Device device = Device.createFromId(deviceId, null, null);

	try {
	
	  device = registryManager.addDevice(device);

	} catch (IotHubException iote) {
	  try {
	
	    device = registryManager.getDevice(deviceId);
	
  	  } catch (IotHubException iotf) {

	    iotf.printStackTrace();

	  }
	}

	System.out.println("가상으로 생성된 장치 정보는 아래와 같습니다.");
	System.out.println("장치 ID: " + device.getDeviceId());
	System.out.println("장치 key: " + device.getPrimaryKey());

    }
}
