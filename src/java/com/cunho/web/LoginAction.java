package com.cunho.web;

import com.cunho.model.UserVO;
import com.cunho.service.LoginService;
import com.cunho.service.impl.LoginServiceImpl;
import com.cunho.util.DBConnection;
import com.cunho.util.Util;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

/**
 * Created by jinyihua on 2016/12/3.
 */
public class LoginAction extends HttpServlet {

    DBConnection dbConnection = new DBConnection();
    LoginService loginService = new LoginServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        UserVO userVO = new UserVO();
        userVO.setUSERNAME(request.getParameter("USERNAME"));
        userVO.setPASSWORD(request.getParameter("PASSWORD"));
        String rememberValue = request.getParameter("REMEMBER");
        request.setAttribute("USERNAME",userVO.getUSERNAME());
        request.setAttribute("PASSWORD",userVO.getPASSWORD());
        if(Util.isEmpty(userVO.getUSERNAME())) {
            request.setAttribute("ERRORMSG","아이디는 필수입력 사항입니다.");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
        if(Util.isEmpty(userVO.getPASSWORD())) {
            request.setAttribute("ERRORMSG","비밀번호는 필수입력 사항입니다.");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
        Connection connection = null;
        try {
            connection = dbConnection.getConnection();
            UserVO currentUser = loginService.login(connection,userVO);
            if (currentUser == null) {
                request.setAttribute("UserVO",userVO);
                request.setAttribute("ERRORMSG","존재하지않는 아이디입니다. ");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            } else {
                if ("1".equals(rememberValue)) {
                    rememberMe(userVO.getUSERNAME(),userVO.getPASSWORD(),response);
                }
                session.setAttribute("currentUser",currentUser);
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbConnection.closeConnection(connection);
        }

    }

    private void rememberMe(String username,String password, HttpServletResponse response) {
        Cookie user = new Cookie("UserVO",username + "-" + password);
        user.setMaxAge(1*60*60*24*7);
        response.addCookie(user);
    }

}
