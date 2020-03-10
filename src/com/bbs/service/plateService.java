package com.bbs.service;

import java.util.ArrayList;

import com.bbs.dao.plateDao;
import com.bbs.pojo.Plate;


public class plateService {
	public static Plate findPlateByName(String plate) {
		return plateDao.findPlateByName(plate);
	}
	public static int addPlate(String plate,String plateText) {
		return plateDao.addPlate(plate,plateText);
	}
	public static ArrayList<Plate> listPlate(){
		return plateDao.listPlate();
	}
}
