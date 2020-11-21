<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.sql.*" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 게시글 삭제-->
	<%@ include file = "dbconn_web.jsp" %>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("user_id");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try{
			String sql = "select * from post";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String rId = rs.getString("id");
				
				if(id.equals(rId)){
					sql = "delete from post where id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					out.println("게시글 아이디에 해당하는 테이블 삭제 완료");
					break;
				}
				
				rId = null;
			}
			
		}
		catch(SQLException ex){
			out.println("SQLException : " + ex.getMessage());
		}
		finally{
			if(rs != null){
				out.println("rs close 발생");
				rs.close();
			}
			if(pstmt != null){
				out.println("2번째 pstmt close 발생");
				pstmt.close();
			}
			if(conn != null){
				out.println("conn close 발생");
				conn.close();
			}
		}
			
		
	%>
</body>
</html>
