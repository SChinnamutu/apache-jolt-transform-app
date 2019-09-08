package com.keybank.jolt.service;

public interface JoltService {

	public String processJoltTransform(String input,String spec);

	public String processValidateJson(String input);
	
}
