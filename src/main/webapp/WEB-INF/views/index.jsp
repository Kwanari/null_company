<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:import url="templates/header.jsp"></c:import>

<title>Document</title>
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="main-header">
				<c:import url="templates/sidebar.jsp"></c:import>
				<c:import url="templates/topbar.jsp"></c:import>
			</div>



			<div class="container">
				<div class="page-inner">
					<div
						class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">


					</div>
					<div class="row">
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div
												class="icon-big text-center icon-primary bubble-shadow-small">
												<i class="fas fa-users" id="test"></i>
											</div>
										</div>
										<div class="col col-stats ms-3 ms-sm-0">
											<div class="numbers">
												<p class="card-category">총 사원</p>
												<h4 class="card-title">1,294</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div
												class="icon-big text-center icon-info bubble-shadow-small">
												<i class="fas fa-user-check" id="close"></i>
											</div>
										</div>
										<div class="col col-stats ms-3 ms-sm-0">
											<div class="numbers">
												<p class="card-category">Subscribers</p>
												<h4 class="card-title">1303</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div
												class="icon-big text-center icon-success bubble-shadow-small">
												<i class="fas fa-luggage-cart"></i>
											</div>
										</div>
										<div class="col col-stats ms-3 ms-sm-0">
											<div class="numbers">
												<p class="card-category">Sales</p>
												<h4 class="card-title">$ 1,345</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div
												class="icon-big text-center icon-secondary bubble-shadow-small">
												<i class="far fa-check-circle"></i>
											</div>
										</div>
										<div class="col col-stats ms-3 ms-sm-0">
											<div class="numbers">
												<p class="card-category">Order</p>
												<h4 class="card-title">576</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8">
							<div class="card card-round">
								<div class="card-header">
									<div class="card-head-row">
										<div class="card-title">공지사항</div>
									</div>
								</div>
								<div class="card-body">
									<div class="chart-container"
										style="max-height: 375px; min-height: 375px; overflow: auto">
										<div id="indexNotice">
											<!-- 공지사항 미리보기 영역 -->
										</div>
									</div>
									<div id="myChartLegend"></div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card card-round">
								<div class="card-header">
									<div class="card-head-row">
										<div class="card-title">오늘의 일정</div>
									</div>
								</div>
								<div class="card-body">
									<div class="chart-container"
										style="max-height: 375px; min-height: 375px; overflow: auto">
										<div id="indexSchedule">
											<!-- 일정 미리보기 영역 -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card card-round">
								<div class="card-header">
									<div class="card-head-row card-tools-still-right">
										<h4 class="card-title">Users Geolocation</h4>
										<div class="card-tools">
											<button class="btn btn-icon btn-link btn-primary btn-xs">
												<span class="fa fa-angle-down"></span>
											</button>
											<button
												class="btn btn-icon btn-link btn-primary btn-xs btn-refresh-card">
												<span class="fa fa-sync-alt"></span>
											</button>
											<button class="btn btn-icon btn-link btn-primary btn-xs">
												<span class="fa fa-times"></span>
											</button>
										</div>
									</div>
									<p class="card-category">Map of the distribution of users
										around the world</p>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-6">
											<div class="table-responsive table-hover table-sales">
												<table class="table">
													<tbody>
														<tr>
															<td>
																<div class="flag">
																	<img src="assets/img/flags/id.png" alt="indonesia" />
																</div>
															</td>
															<td>Indonesia</td>
															<td class="text-end">2.320</td>
															<td class="text-end">42.18%</td>
														</tr>
														<tr>
															<td>
																<div class="flag">
																	<img src="assets/img/flags/us.png" alt="united states" />
																</div>
															</td>
															<td>USA</td>
															<td class="text-end">240</td>
															<td class="text-end">4.36%</td>
														</tr>
														<tr>
															<td>
																<div class="flag">
																	<img src="assets/img/flags/au.png" alt="australia" />
																</div>
															</td>
															<td>Australia</td>
															<td class="text-end">119</td>
															<td class="text-end">2.16%</td>
														</tr>
														<tr>
															<td>
																<div class="flag">
																	<img src="assets/img/flags/ru.png" alt="russia" />
																</div>
															</td>
															<td>Russia</td>
															<td class="text-end">1.081</td>
															<td class="text-end">19.65%</td>
														</tr>
														<tr>
															<td>
																<div class="flag">
																	<img src="assets/img/flags/cn.png" alt="china" />
																</div>
															</td>
															<td>China</td>
															<td class="text-end">1.100</td>
															<td class="text-end">20%</td>
														</tr>
														<tr>
															<td>
																<div class="flag">
																	<img src="assets/img/flags/br.png" alt="brazil" />
																</div>
															</td>
															<td>Brasil</td>
															<td class="text-end">640</td>
															<td class="text-end">11.63%</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="col-md-6">
											<div class="mapcontainer">
												<div id="world-map" class="w-100" style="height: 300px"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="card card-round">
								<div class="card-body">
									<div class="card-head-row card-tools-still-right">
										<div class="card-title">New Customers</div>
										<div class="card-tools">
											<div class="dropdown">
												<button class="btn btn-icon btn-clean me-0" type="button"
													id="dropdownMenuButton" data-bs-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false">
													<i class="fas fa-ellipsis-h"></i>
												</button>
												<div class="dropdown-menu"
													aria-labelledby="dropdownMenuButton">
													<a class="dropdown-item" href="#">Action</a> <a
														class="dropdown-item" href="#">Another action</a> <a
														class="dropdown-item" href="#">Something else here</a>
												</div>
											</div>
										</div>
									</div>
									<div class="card-list py-4">
										<div class="item-list">
											<div class="avatar">
												<img src="assets/img/jm_denis.jpg" alt="..."
													class="avatar-img rounded-circle" />
											</div>
											<div class="info-user ms-3">
												<div class="username">Jimmy Denis</div>
												<div class="status">Graphic Designer</div>
											</div>
											<button class="btn btn-icon btn-link op-8 me-1">
												<i class="far fa-envelope"></i>
											</button>
											<button class="btn btn-icon btn-link btn-danger op-8">
												<i class="fas fa-ban"></i>
											</button>
										</div>
										<div class="item-list">
											<div class="avatar">
												<span
													class="avatar-title rounded-circle border border-white">CF</span>
											</div>
											<div class="info-user ms-3">
												<div class="username">Chandra Felix</div>
												<div class="status">Sales Promotion</div>
											</div>
											<button class="btn btn-icon btn-link op-8 me-1">
												<i class="far fa-envelope"></i>
											</button>
											<button class="btn btn-icon btn-link btn-danger op-8">
												<i class="fas fa-ban"></i>
											</button>
										</div>
										<div class="item-list">
											<div class="avatar">
												<img src="assets/img/talha.jpg" alt="..."
													class="avatar-img rounded-circle" />
											</div>
											<div class="info-user ms-3">
												<div class="username">Talha</div>
												<div class="status">Front End Designer</div>
											</div>
											<button class="btn btn-icon btn-link op-8 me-1">
												<i class="far fa-envelope"></i>
											</button>
											<button class="btn btn-icon btn-link btn-danger op-8">
												<i class="fas fa-ban"></i>
											</button>
										</div>
										<div class="item-list">
											<div class="avatar">
												<img src="assets/img/chadengle.jpg" alt="..."
													class="avatar-img rounded-circle" />
											</div>
											<div class="info-user ms-3">
												<div class="username">Chad</div>
												<div class="status">CEO Zeleaf</div>
											</div>
											<button class="btn btn-icon btn-link op-8 me-1">
												<i class="far fa-envelope"></i>
											</button>
											<button class="btn btn-icon btn-link btn-danger op-8">
												<i class="fas fa-ban"></i>
											</button>
										</div>
										<div class="item-list">
											<div class="avatar">
												<span
													class="avatar-title rounded-circle border border-white bg-primary">H</span>
											</div>
											<div class="info-user ms-3">
												<div class="username">Hizrian</div>
												<div class="status">Web Designer</div>
											</div>
											<button class="btn btn-icon btn-link op-8 me-1">
												<i class="far fa-envelope"></i>
											</button>
											<button class="btn btn-icon btn-link btn-danger op-8">
												<i class="fas fa-ban"></i>
											</button>
										</div>
										<div class="item-list">
											<div class="avatar">
												<span
													class="avatar-title rounded-circle border border-white bg-secondary">F</span>
											</div>
											<div class="info-user ms-3">
												<div class="username">Farrah</div>
												<div class="status">Marketing</div>
											</div>
											<button class="btn btn-icon btn-link op-8 me-1">
												<i class="far fa-envelope"></i>
											</button>
											<button class="btn btn-icon btn-link btn-danger op-8">
												<i class="fas fa-ban"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-8">
							<div class="card card-round">
								<div class="card-header">
									<div class="card-head-row card-tools-still-right">
										<div class="card-title">Transaction History</div>
										<div class="card-tools">
											<div class="dropdown">
												<button class="btn btn-icon btn-clean me-0" type="button"
													id="dropdownMenuButton" data-bs-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false">
													<i class="fas fa-ellipsis-h"></i>
												</button>
												<div class="dropdown-menu"
													aria-labelledby="dropdownMenuButton">
													<a class="dropdown-item" href="#">Action</a> <a
														class="dropdown-item" href="#">Another action</a> <a
														class="dropdown-item" href="#">Something else here</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body p-0">
									<div class="table-responsive">
										<!-- Projects table -->
										<table class="table align-items-center mb-0">
											<thead class="thead-light">
												<tr>
													<th scope="col">Payment Number</th>
													<th scope="col" class="text-end">Date & Time</th>
													<th scope="col" class="text-end">Amount</th>
													<th scope="col" class="text-end">Status</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">
														<button
															class="btn btn-icon btn-round btn-success btn-sm me-2">
															<i class="fa fa-check"></i>
														</button> Payment from #10231
													</th>
													<td class="text-end">Mar 19, 2020, 2.45pm</td>
													<td class="text-end">$250.00</td>
													<td class="text-end"><span class="badge badge-success">Completed</span>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<button
															class="btn btn-icon btn-round btn-success btn-sm me-2">
															<i class="fa fa-check"></i>
														</button> Payment from #10231
													</th>
													<td class="text-end">Mar 19, 2020, 2.45pm</td>
													<td class="text-end">$250.00</td>
													<td class="text-end"><span class="badge badge-success">Completed</span>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<button
															class="btn btn-icon btn-round btn-success btn-sm me-2">
															<i class="fa fa-check"></i>
														</button> Payment from #10231
													</th>
													<td class="text-end">Mar 19, 2020, 2.45pm</td>
													<td class="text-end">$250.00</td>
													<td class="text-end"><span class="badge badge-success">Completed</span>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<button
															class="btn btn-icon btn-round btn-success btn-sm me-2">
															<i class="fa fa-check"></i>
														</button> Payment from #10231
													</th>
													<td class="text-end">Mar 19, 2020, 2.45pm</td>
													<td class="text-end">$250.00</td>
													<td class="text-end"><span class="badge badge-success">Completed</span>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<button
															class="btn btn-icon btn-round btn-success btn-sm me-2">
															<i class="fa fa-check"></i>
														</button> Payment from #10231
													</th>
													<td class="text-end">Mar 19, 2020, 2.45pm</td>
													<td class="text-end">$250.00</td>
													<td class="text-end"><span class="badge badge-success">Completed</span>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<button
															class="btn btn-icon btn-round btn-success btn-sm me-2">
															<i class="fa fa-check"></i>
														</button> Payment from #10231
													</th>
													<td class="text-end">Mar 19, 2020, 2.45pm</td>
													<td class="text-end">$250.00</td>
													<td class="text-end"><span class="badge badge-success">Completed</span>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<button
															class="btn btn-icon btn-round btn-success btn-sm me-2">
															<i class="fa fa-check"></i>
														</button> Payment from #10231
													</th>
													<td class="text-end">Mar 19, 2020, 2.45pm</td>
													<td class="text-end">$250.00</td>
													<td class="text-end"><span class="badge badge-success">Completed</span>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<script src="/resources/js/notice/preview.js"></script>
			<c:import url="templates/footer.jsp"></c:import>


		</div>
		
	</div>
	<c:import url="templates/bootfooter.jsp"></c:import>
</body>
</html>