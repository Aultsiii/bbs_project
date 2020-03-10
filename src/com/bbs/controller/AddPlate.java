package com.bbs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.StringUtils;
import com.bbs.service.plateService;
@WebServlet("/add_plate")
public class AddPlate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-Type","application/json;charset=utf-8");
		String plate = request.getParameter("plate");
		String platetext = request.getParameter("platetext");
		
		if(StringUtils.isNullOrEmpty(plate) 
				|| plate.trim().length()==0) {
			request.setAttribute("error", "板块名字不能为空");
			request.getRequestDispatcher("/plate.jsp").forward(request, response);
			return;
		}
		plate = plate.trim();
		if(plateService.findPlateByName(plate) != null) {
			request.setAttribute("error", "版块名已经存在");
			request.getRequestDispatcher("/plate.jsp").forward(request, response);
			return;
		}
		plateService.addPlate(plate,platetext);
		request.setAttribute("error", "版块添加成功");
		request.getRequestDispatcher("/plate.jsp").forward(request, response);
		return;
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
