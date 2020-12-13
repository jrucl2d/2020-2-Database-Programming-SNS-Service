package CommentBean;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import CommentBean.*;

public class CommentMgr {

	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public CommentMgr() {
		try {
			ocpds = new OracleConnectionPoolDataSource();

			ocpds.setURL("데이터베이스 url");
			ocpds.setUser("아이디");
			ocpds.setPassword("비밀번호");

			pool = ocpds.getPooledConnection();
		} catch (Exception e) {
			System.out.println("Error : Connection Failed");
		}
	}

	public Vector getCommentList(int postId) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			conn = pool.getConnection();

			String mySQL = "select commentid, commentcontent, project_user.useremail, username from project_comment, project_user" +
					" where project_comment.postid=" + postId + " and project_comment.useremail=project_user.useremail and project_comment.deleteddate is null " +
					"order by project_comment.createddate desc";
			pstmt = conn.prepareStatement(mySQL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Comment comment = new Comment();
				comment.setPostid(postId);
				comment.setCommentid(rs.getInt("commentid"));
				comment.setComment(rs.getString("commentcontent"));
				comment.setUseremail(rs.getString("useremail"));
				comment.setUsername(rs.getString("username"));

				vecList.add(comment);
			}
			pstmt.close();
			conn.close();

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		return vecList;
	}

	public void deleteComment(int cid) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		ResultSet rs = null;

		try {
			conn = pool.getConnection();
			String mySQL = "update project_comment set deleteddate=SYSDATE where commentid=" + cid;
			pstmt = conn.prepareStatement(mySQL);
			rs = pstmt.executeQuery();
			pstmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
	}

	public int insertNewComment(String comment, String useremail, int pid) {
		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = pool.getConnection();

			String mySQL = "";
			cstmt = conn.prepareCall("{call project_comment_insert(?, ?, ?)}");
			cstmt.setString(1, comment);
			cstmt.setString(2, useremail);
			cstmt.setInt(3, pid);
			cstmt.execute();

			cstmt.close();
			conn.close();
			return 1;

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
			return 0;
		}
	}

	public int updateComment(String comment, int commentId) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		ResultSet rs = null;

		try {
			conn = pool.getConnection();
			String mySQL = "update project_comment set commentcontent='" + comment + "' where commentid=" + commentId;
			pstmt = conn.prepareStatement(mySQL);
			rs = pstmt.executeQuery();
			pstmt.close();
			conn.close();
			return 1;
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
			return 0;
		}
	}
}