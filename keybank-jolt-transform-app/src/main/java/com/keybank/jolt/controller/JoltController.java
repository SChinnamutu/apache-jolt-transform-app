package com.keybank.jolt.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.keybank.jolt.service.JoltService;

@Controller
@RequestMapping("/jolt")
public class JoltController {

    private static final Logger LOGGER = LoggerFactory.getLogger(JoltController.class);
    
    @Autowired
    JoltService joltService;

    @RequestMapping("/")
    public ModelAndView getJoltTransformView() {
        LOGGER.debug("Received request to view jolt transform page.");
        return new ModelAndView("jolt_transform");
    }
    
    
    @RequestMapping(value = "/transform.html", method = RequestMethod.POST)
    @ResponseBody
    public String processJoltTransform(HttpServletRequest request) {
    	String response = null;
     	try {
     		  String input = request.getParameter("input_json");
     		  String spec = request.getParameter("spec_json");
     		  response =  joltService.processJoltTransform(input, spec);
   		} catch (Exception e) {
   			LOGGER.error("Error occured in processJoltTransform() and exception is" + e); 
   			return "";
   		}
        return response;
    }
    
    @RequestMapping(value = "/validate.html", method = RequestMethod.POST)
    @ResponseBody
    public String processValidateJson(HttpServletRequest request) {
    	LOGGER.debug("processValidateJson Inits");
    	String response = null;
     	try {
     		  String input = request.getParameter("input");
     		  response =  joltService.processValidateJson(input);
   		} catch (Exception e) {
   			LOGGER.error("Error occured in processValidateJson() and exception is" + e); 
   			return "ERROR";
   		}
     	LOGGER.debug("processValidateJson Ends");
        return response;
    }

}
