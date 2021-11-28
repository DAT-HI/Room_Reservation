package Final_project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class reservationDao {
	//MySQL DB 연동 시작!!
			String id = "root";
			String pass = "111111";
			//jdbc:mysql://localhost:3306/jspdb <-- DB명
			String url = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf-8";
			
			Connection con = null; //DB연결
			PreparedStatement pstmt = null; //SQL문 구성
			ResultSet rs = null; //SQL문 실행 결과 처리
			
			public void connect_cp(){
				
				//컨텍스트 객체 생성
				try {
					Context initctx = new InitialContext();
					
					//context.xml 기반의 환경설정 객체 접근 객쳅변수 설정
					Context envctx = (Context) initctx.lookup("java:/comp/env");
					
					//커넥션 풀에 접근
					DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
					
					//db 연결
					con = ds.getConnection();
					
					System.out.println("커넥션 풀을 이용하여 데이터베이스 연결 성공!!");
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			

			//데이터베이스 연결
			public void connect(){
				//드라이버 로드
				try{
					Class.forName("com.mysql.jdbc.Driver");
					//DB 연결
					con = DriverManager.getConnection(url, id, pass);
				
					System.out.println("MySQL 연결 성공!! ");
					
				} catch (Exception e){
					e.printStackTrace();
				}
			}
			
			//데이터베이스 연결 해제
			public void disConnect(){
				if(con != null){
					try{
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(pstmt != null){
					try{
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(rs != null){
					try{
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			
			public void insertReservation(reservationDo rDo){
				//1. DB연결
				connect_cp();
				
				//2. SQL처리
				//SQL 구성
				String sql = "insert into reservation (cin, cout, roomtype, name, tel, email, person, pay)"
						+ "values(?,?,?,?,?,?,?,?)";
				
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, rDo.getCin());
					pstmt.setString(2, rDo.getCout());
					pstmt.setString(3, rDo.getRoomtype());
					pstmt.setString(4, rDo.getName());
					pstmt.setString(5, rDo.getTel());
					pstmt.setString(6, rDo.getEmail());
					pstmt.setString(7, rDo.getPerson());
					pstmt.setString(8, rDo.getPay());
					
					//SQL 실행
					pstmt.executeUpdate();
					System.out.println("insertReservation(reservationDo rDo) 데이터베이스 처리 완료!!");
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//3. DB연결 해제
				disConnect();
			
			}
			
			public ArrayList<reservationDo> getAllReservation(){
				//1. DB연결
				connect_cp();
				
				//2. SQL문 처리
				ArrayList<reservationDo> aList = new ArrayList<reservationDo>();
				String sql = "select * from reservation";
				try {
					pstmt = con.prepareStatement(sql);
					
					//3. 실행
					rs = pstmt.executeQuery();
					while(rs.next()){
						reservationDo rDo = new reservationDo();
						rDo.setNum(rs.getInt(1));
						rDo.setCin(rs.getString(2));
						rDo.setCout(rs.getString(3));
						rDo.setRoomtype(rs.getString(4));
						rDo.setName(rs.getString(5));
						rDo.setTel(rs.getString(6));
						rDo.setEmail(rs.getString(7));
						rDo.setPerson(rs.getString(8));
						rDo.setPay(rs.getString(9));
						
						aList.add(rDo);
					}
					System.out.println("getAllReservation() 처리완료!!");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				//3. DB연결 해제
				disConnect();
				
				return aList;
			}
			
			public reservationDo getReservationOne(int num){
				System.out.println("getReservationOne() 처리시작!!");
				connect_cp();
				
				reservationDo rDo = new reservationDo();
				
				try {
					String sql = "select * from reservation where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						rDo.setNum(rs.getInt(1));
						rDo.setCin(rs.getString(2));
						rDo.setCout(rs.getString(3));
						rDo.setRoomtype(rs.getString(4));
						rDo.setName(rs.getString(5));
						rDo.setTel(rs.getString(6));
						rDo.setEmail(rs.getString(7));
						rDo.setPerson(rs.getString(8));
						rDo.setPay(rs.getString(9));
						
					}
					disConnect();
					
					System.out.println("getReservationOne() 처리완료!!");
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return rDo;
			}
			
			public void modifyReservation(reservationDo rDo){
				System.out.println("modifyReservation() 처리시작!!");
				connect_cp();
				
				try {
					String sql = "update reservation set cin=?, cout=?, roomtype=?, name=?, tel=?, email=?, person=?, pay=?"
							+ "where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, rDo.getCin());
					pstmt.setString(2, rDo.getCout());
					pstmt.setString(3, rDo.getRoomtype());
					pstmt.setString(4, rDo.getName());
					pstmt.setString(5, rDo.getTel());
					pstmt.setString(6, rDo.getEmail());
					pstmt.setString(7, rDo.getPerson());
					pstmt.setString(8, rDo.getPay());
					pstmt.setInt(9, rDo.getNum());
					pstmt.executeUpdate();
					
					disConnect();
					System.out.println("modifyReservation() 처리완료!!");
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			public void deleteReservation(int num){
				System.out.println("deleteReservation() 처리 시작!! ");
				connect_cp();
							
				try {
					String sql = "delete from reservation where num =? ";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					
					pstmt.executeUpdate();
					
					disConnect();
					System.out.println("deleteReservation() 처리 완료!! ");
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
}
