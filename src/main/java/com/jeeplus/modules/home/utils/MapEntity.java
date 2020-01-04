package com.jeeplus.modules.home.utils;

import java.io.Serializable;

public class MapEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	public String name;
	public double[] lng;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double[] getLng() {
		return lng;
	}
	public void setLng(double[] lng) {
		this.lng = lng;
	}
}
