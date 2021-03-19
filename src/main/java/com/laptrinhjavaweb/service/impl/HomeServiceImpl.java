package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.service.IHomeService;

@Service
public class HomeServiceImpl implements IHomeService{

	@Override
	public List<String> loadMenu() {
		List<String> menus = new ArrayList<>();
		menus.add("Học thì học");
		menus.add("Không học thì học");
		menus.add("Mà không học thì thôi");
		return menus;
	}

}
