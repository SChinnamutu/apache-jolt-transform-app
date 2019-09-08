package com.keybank.jolt.service;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.bazaarvoice.jolt.Chainr;
import com.bazaarvoice.jolt.JsonUtils;


@Service
public class JoltServiceImpl  implements JoltService{

	@Override
	public String processJoltTransform(String input, String spec) {
		List<Object> specs = JsonUtils.jsonToList(spec);
	    Chainr chainr = Chainr.fromSpec(specs);
	    Object inputJSON = JsonUtils.jsonToObject(input);
	    Object transformedOutput = chainr.transform(inputJSON);
	    return JsonUtils.toPrettyJsonString(transformedOutput);
	}

	@Override
	public String processValidateJson(String input) {
	    try {
	        new JSONObject(input);
	    } catch (JSONException ex) {
	        try {
	            new JSONArray(input);
	        } catch (JSONException ex1) {
	            return "ERROR";
	        }
	    }
	    return "SUCCESS";
	}

}
