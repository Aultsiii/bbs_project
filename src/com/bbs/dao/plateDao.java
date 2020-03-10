package com.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bbs.pojo.Plate;
import com.bbs.tools.BaseDao;


public class plateDao {
	public static Plate findPlateByName(String plate) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Plate Plate = null;
		try {
			conn = BaseDao.getCon();
			String sql = "select * from bbs_plate where plateTitle=?";
			ps = conn.prepareStatement(sql);
			rs = BaseDao.query(ps, new Object[] {plate});
			if(rs.next()) {
				Plate = new Plate(rs.getInt("plateId"),rs.getString("plateTitle"),rs.getString("plateMessage"));
			}
		} catch (Exception e) {e.printStackTrace();
		} finally {
			try {
				BaseDao.close(conn, ps, rs);
			} catch (Exception e2) {e2.printStackTrace();}
		}
		return Plate;
	}
	
	public static int addPlate(String plate,String plateText) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = BaseDao.getCon();
			String sql = "insert into bbs_plate(plate,plateText) values(?,?)";
			ps = conn.prepareStatement(sql);
			return BaseDao.alter(ps, new Object[] {plate},new Object[] {plateText});
		} catch (Exception e) {e.printStackTrace();
		} finally {
			try {
				BaseDao.close(conn, ps, null);
			} catch (Exception e2) {e2.printStackTrace();}
		}
		return 0;
	}
	public static ArrayList<Plate> listPlate(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Plate> array = new ArrayList<>();
		try {
			conn = BaseDao.getCon();
			String sql = "select * from bbs_plate";
			ps = conn.prepareStatement(sql);
			rs = BaseDao.query(ps, null);
			while(rs.next()) {
			}
		} catch (Exception e) {e.printStackTrace();
		} finally {
			try {
				BaseDao.close(conn, ps, rs);
			} catch (Exception e2) {e2.printStackTrace();}
		}
		return array;
	}
}
