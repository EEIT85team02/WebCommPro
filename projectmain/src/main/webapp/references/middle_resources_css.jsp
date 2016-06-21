<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<!-- 按鈕1 -->
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6  col-lg-6">
						<div class="thumbnail">
<!-- 							<img src="http://img.technews.tw/wp-content/uploads/2015/09/google-leiphone0902.jpg" alt="..."> -->
								<img src="" alt="...">
							<div class="caption">
								<h3>Google帳戶</h3>
								<p>使用您在報名時期填寫的Google帳戶登入本預約系統</p>
								<p>
<!-- 									<a href="#" class="btn btn-primary" role="button">Button</a> -->
<!-- 									<a href="http://localhost:8080/Hibernate01/UserInfo.jsp" class="btn btn-primary" role="button">登入報名系統</a> -->
									<a href="${pageContext.request.contextPath}/LoginServletGoogle.do" class="btn btn-primary" role="button">登入報名系統</a>
								</p>
							</div>
						</div>
					</div>
				
				<!-- 按鈕2 -->
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6  col-lg-6">
						<div class="thumbnail">
<!-- 							<img src="http://media.idownloadblog.com/wp-content/uploads/2014/03/Yahoo-Mail-2.0.6-for-iOS-app-icon-small1.png" alt="yahoo" style="display:inline"> -->
								<img src="" alt="...">
<!-- 							<img src="https://www.slipstick.com/images/2011/10/icloud-icon-136x176.jpg" alt="icoud" style="display:inline"> -->
							<div class="caption">
								<h3>非Google帳戶</h3>
								<p>使用您在報名時期填寫的e-mail帳戶登入本預約系統</p>
								<p>
<!-- 									<a href="http://localhost:8080/Hibernate01/Login.jsp" class="btn btn-primary" role="button">登入報名系統</a> -->
									<a href="${pageContext.request.contextPath}/01_login/Login.jsp" class="btn btn-primary" role="button">登入報名系統</a>
<!-- 									<a href="#" class="btn btn-default" role="button">Button</a> -->
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>