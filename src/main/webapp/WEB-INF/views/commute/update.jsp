<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="../templates/header.jsp"></c:import>
	<script src="../../resources/js/core/jquery-3.7.1.min.js"></script>

	<title>근태관리(관리자)</title>
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="main-header">
				<c:import url="../templates/sidebar.jsp"></c:import>
				<c:import url="../templates/topbar.jsp"></c:import>
			</div>

			<div class="container">
				<div class="page-inner">

					<div class="page-header">
						<h3 class="fw-bold mb-3">근태관리</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home">
								<a href="#">
									<i class="icon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">근태관리</a>
							</li>							
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">근태관리(관리자)</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							
						</ul>
					</div>



					<div class="row">


						<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <div class="d-flex align-items-center">
                <h4 class="card-title">근태관리(관리자)</h4>
            </div>
        </div>
        <div class="card-body">
            <table id="add-row" class="display table table-striped table-hover">
                <thead>
                    <tr>
                        <th>사원번호</th>
                        <th>사원이름</th>
                        <th>출근시간</th>
                        <th>퇴근시간</th>
                        <th style="width: 20%">출근/퇴근/결근</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="vo">
                        <tr>
                            <td>${vo.empNum}</td>
                            <td>${vo.empName}</td>
                            <td>${vo.formattedCommuteInTime}</td>
                            <td>${vo.formattedCommuteOutTime}</td>
                            <td>
                                <form action="/commute/update" method="post">
                                    <input type="hidden" name="empNum" value="${vo.empNum}" />
                                    <select name="commuteStatus">
                                        <option value="1" ${vo.commuteStatus == 1 ? 'selected' : ''}>출근</option>
                                        <option value="2" ${vo.commuteStatus == 2 ? 'selected' : ''}>퇴근</option>
                                        <option value="0" ${vo.commuteStatus == 0 ? 'selected' : ''}>결근</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary btn-sm">저장</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

					</div>
					
			
				</div> <!-- page-inner -->
			</div> <!-- container -->
			

			<c:import url="../templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
	
	
    <script>
      $(document).ready(function () {

        // Add Row
        $("#appr-doc-table").DataTable({
          pageLength: 10,
        });

        var action =
          '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

      });
    </script>
</body>
</html>