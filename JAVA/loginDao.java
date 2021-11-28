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


public class loginDao {
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
			public void insertLogin(loginDo aDo){
				//1. DB연결
				//connect();
				connect_cp();
				
				//2. SQL처리
				//SQL 구성
				String sql = "insert into login (id, password)"
						+ "values(?,?)";
				
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, aDo.getId());
					pstmt.setString(2, aDo.getPassword());
					
					//SQL 실행
					pstmt.executeUpdate();
					System.out.println("addressInsert(addressDo aDo) 데이터베이스 처리 완료!!");
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//3. DB연결 해제
				disConnect();
			}
			public ArrayList<loginDo> getAllLogin(){
				//1. DB연결
				//connect();
				connect_cp();
				
				//2. SQL문 처리
				ArrayList<loginDo> aList = new ArrayList<loginDo>();
				String sql = "select * from login";
				try {
					pstmt = con.prepareStatement(sql);
					
					//3. 실행
					rs = pstmt.executeQuery();
					int i=1;
					while(rs.next()){
						loginDo aDo = new loginDo();
						aDo.setId(rs.getString(1));
						aDo.setPassword(rs.getString(2));
						
						aList.add(aDo);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				//3. DB연결 해제
				disConnect();
				
				return aList;
			}

		}

		

