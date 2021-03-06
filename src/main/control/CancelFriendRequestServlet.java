package main.control;

import main.JDBC.FriendsSearch;
import main.admin.admin_model;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CancelFriendRequestServlet")
public class CancelFriendRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取 自身的 userid
        HttpSession session = request.getSession();
        int user_id = (int) session.getAttribute("userid");
        int friend_id = Integer.parseInt(request.getParameter("friend_id"));
        FriendsSearch.deleteFriend(friend_id,user_id);
        FriendsSearch.deleteFriend(user_id,friend_id);
        admin_model am  = new admin_model();
        try {
            am.log_delete_friend(user_id, friend_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.getWriter().write("cancel success");

        //得到需要 cancel 的 friend_id



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        doPost(request,response);
    }
}
