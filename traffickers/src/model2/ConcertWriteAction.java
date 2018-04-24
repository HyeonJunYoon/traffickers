package model2;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.ConcertDAO;
import model1.ConcertTO;

public class ConcertWriteAction implements ConcertAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ConcertWriteAction 확인");
		
	}
}