package com.model;

public class SendEmail implements Runnable{

	@Override
	public void run() {
		// TODO Auto-generated method stub
		int i=0;

		try {
			Thread.sleep(1*1000);
			System.out.println("发送邮件"+(i++));
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

}
