// 결재선 설정 모달창 사원 검색
document.getElementById('searchEmpName').addEventListener('input', function () {
	const filter = this.value.toLowerCase();
	const empItems = document.querySelectorAll('.emp-item');
	const collapses = document.querySelectorAll('.collapse');		
	
	// 모든 collapse 닫기
	collapses.forEach(collapse => {
		collapse.classList.remove('show');
	});

	let foundMatch = false;

	empItems.forEach(item => {
		const empName = item.querySelector('.empName').textContent.toLowerCase();
		if (empName.includes(filter)) {
			item.parentElement.style.display = ''; // 매치된 항목 보이기
			item.style.backgroundColor = '#e1f3fd'; // 검색된 사원 배경색
			const collapseElement = item.closest('.collapse');
            
			// 매치되는 사원이 있는 부서를 열기
			if (collapseElement && !collapseElement.classList.contains('show')) {
				collapseElement.classList.add('show');
			}
				
			foundMatch = true;
		}
		else {
			item.style.backgroundColor = '';
			/* item.parentElement.style.display = 'none'; // 매치되지 않는 항목 숨기기 */
		}
	});

	// 검색어가 없을 때 모든 부서 닫기
	if (!filter) {
		empItems.forEach(item => {
			item.style.background ='';
		});
		document.querySelectorAll('.collapse').forEach(collapse => {
			collapse.classList.remove('show');
		});
	}
});



// 사원 리스트에서 사원 선택    
let selectedEmp = null;

document.querySelectorAll('.emp-item').forEach(item => {
    item.addEventListener('mouseover', function() {
        // 현재 마우스 오버된 항목 강조
        selectedEmp = this;
        selectedEmp.style.backgroundColor = '#eaeaea';
    });
    item.addEventListener('mouseout', function() {
    	// 마우스 아웃된 항목 강조 해제
    	selectedEmp = this;
		selectedEmp.style.backgroundColor = '';        	
    });
});



/*// 모달이 열릴 때 초기화
const apprLineModal = document.getElementById('apprLineModal');
apprLineModal.addEventListener('show.bs.modal', function () {
    // 선택된 템플릿 초기화
    if (selectedEmp) {
        selectedEmp.style.backgroundColor = ''; // 선택 해제
        selectedEmp = null;
    }

    // 모든 collapse를 닫음
    document.querySelectorAll('.collapse').forEach(collapse => {
        collapse.classList.remove('show');
    });
});	*/    




// 사원 리스트에서 결재 라인에 결재자로 추가 기능

// 결재자 수 카운트
let approverCount = 0;
// 추가된 결재자 리스트
let addedApprovers = [];


// 결재선 설정 버튼에 값을 담기 위한 리스트
let empNames = [];
let posNames = [];

// 문서별 결재자 최대 추가 제한
const docTypecode = document.getElementById("hiddenDocTypecode");
let maxApproverCount = 2;

// 좌측 사원 리스트에 있는 추가 버튼
$("#apprLineModalBody1").on("click", ".approverPlusBtn", function(){

	const empNum = $(this).siblings('.hiddenEmpNum').val();	
    const empName = $(this).siblings('.empName').text();
    const deptName = $(this).siblings('.hiddenDeptName').val();
    const posName = $(this).siblings('.posName').text();	
	const posNum = $(this).siblings('.hiddenPosNum').val();
	
	approverCount++;

    // 결재 라인에 추가할 새로운 구조 생성
    const newApprovalLine = `
        <tr class="approverField">
            <td colspan="5" style="text-align: center !important; padding: 0 !important;">
                <i class="fas fa-caret-down" style="zoom: 2.0;"></i>
            </td>
        </tr>
        <tr class="approverField approverFieldApprover">
            <td>
                <i class="fas fa-minus removeApprover" style="zoom: 1.5; color: #d9534f; cursor: pointer; margin-left: 10px; position: relative; top: 1px;"></i>
            </td>
            <td>
				${empName}
				<input class="hiddenEmpNum" type="hidden" value="${empNum}">
				<input class="hiddenPosNum" type="hidden" value="${posNum}">
			</td>
            <td>${posName}</td>
            <td>${deptName}</td>
            <td>결재 ${approverCount}</td>
        </tr>
    `;

    // apprLineTable에 새로운 결재 라인 추가
    $('.apprLineTable tbody').append(newApprovalLine);
			
	
	addedApprovers.push(empNum); // 추가된 사원 empNum 저장
	empNames.push(empName);
	posNames.push(posName);
	
	//alert('결재자1: '+ empNames[0] + ' 결재자2: ' + empNames[1] + ' 결재자3: ' + empNames[2]);
	
	$(this).hide(); // 추가한 사원의 + 버튼 숨김
	
	if(docTypecode.value == 2) {
		maxApproverCount = 3;
	}else {
		maxApproverCount = 2;
	}

	if (approverCount >= maxApproverCount) { // 결재자는 최대 3명까지만 추가
		$('.approverPlusBtn').hide();
	    return;
	}
	
	// 추가한 사원보다 직위가 낮은 사원의 + 버튼 숨김
	$('.emp-item').each(function() {
		const currentPosNum = $(this).find('.hiddenPosNum').val();
		if (parseInt(currentPosNum) <= parseInt(posNum)) {
			$(this).find('.approverPlusBtn').hide();
		}
	});	
	

})


// 결재자 제거
$('#apprLineModalBody2').on('click','.removeApprover' , function() {
	
	const currentRow = $(this).closest('tr');
	const empNum = currentRow.find('.hiddenEmpNum').val();
	
	//const empName = currentRow.find('.empName').text().trim();
	//const posName = currentRow.find('.posName').text().trim();
	const empName = currentRow.children('td').eq(1).text().trim();
	const posName = currentRow.children('td').eq(2).text().trim();
	
	
	// 현재 행 이후의 모든 결재자들 제거
	let nextRowRemoveCount = 0;
	
	currentRow.nextAll().each(function() {
	    const nextEmpNum = $(this).find('.hiddenEmpNum').val();
		if(nextEmpNum) {
		    addedApprovers = addedApprovers.filter(code => code !== nextEmpNum); // 다음 모든 결재자 empNum 제거		
		}
		
		nextRowRemoveCount++;
		
		//요것들 지금 작동안함
		//const nextEmpName = $(this).find('.empName').text().trim();
		//empNames = empNames.filter(code => code !== nextEmpName);		
		//const nextPosName = $(this).find('.posName').text().trim();
		//posNames = posNames.filter(code => code !== nextPosName);	
		const nextEmpName = $(this).children('td').eq(1).text().trim();
		empNames = empNames.filter(name => name !== nextEmpName);
		const nextPosName = $(this).children('td').eq(2).text().trim();
		posNames = posNames.filter(pos => pos !== nextPosName);		
		
		
	});
	currentRow.nextAll().remove(); // 제거한 결재자 이후의 결재자까지 모두 삭제
	
	approverCount = approverCount - (nextRowRemoveCount/2); // 화살표 행까지 같이 지워야해서
	
	currentRow.prev().remove(); // 현재 결재자 행 이전 행(화살표 아이콘) 삭제
	currentRow.remove(); // 현재 결재자 행을 삭제
	
	// 추가된 empNum 리스트에서 제거
	addedApprovers = addedApprovers.filter(numCode => numCode !== empNum);
	console.log('결재자1: ' +  addedApprovers[0])
	console.log('결재자2: ' +  addedApprovers[1])
	console.log('결재자3: ' +  addedApprovers[2])
	
	
	//요것들 지금 작동안함
	//empNames = empNames.filter(code => code !== empName);
	//posNames = posNames.filter(code => code !== posName);
	empNames = empNames.filter(name => name !== empName);
	posNames = posNames.filter(pos => pos !== posName)
	
	
	
	//alert('결재자1: '+ empNames[0] + ' 결재자2: ' + empNames[1] + ' 결재자3: ' + empNames[2]);
	
	approverCount --;
	
	if(docTypecode.value == 2) {
		maxApproverCount = 3;
	}else {
		maxApproverCount = 2;
	}

    // 결재자 수가 3명 미만이 되면 추가 버튼 다시 보임
    if (approverCount < maxApproverCount) {
        $('.approverPlusBtn').show();
    } else {
		$('.approverPlusBtn').hide();
	}
	
	// 남아있는 결재자 중 가장 높은 직위의 posNum 찾기
	let highestPosNum = Math.max(...addedApprovers.map(emp => {
		return $('#apprLineModalBody1').find(`.hiddenEmpNum[value="${emp}"]`).siblings('.hiddenPosNum').val();
	}));	
	
	// 결재라인 리스트에 결재자가 추가되어있는지 판별
	$('.emp-item').each(function () {
	    const empNumInList = $(this).find('.hiddenEmpNum').val();
		const posNumInList = $(this).find('.hiddenPosNum').val();
	    if (!addedApprovers.includes(empNumInList) && posNumInList > highestPosNum) {
	        $(this).find('.approverPlusBtn').show(); 
	    } else {
	        $(this).find('.approverPlusBtn').hide(); 
	    }
	});
	
});
	
	
// 결재라인 저장
$('#submitApprLine').on('click', function() {
	
	const apprLineBtn = document.getElementById('apprLineBtn');
	let apprLineText = '';
	
	if (!empNames[0]) {
		apprLineText = '결재선 설정';
	}
	if (empNames[0]) {
		apprLineText += `(${posNames[0]}) ${empNames[0]}`;
		document.getElementById('hiddenApprover1').value = addedApprovers[0];
	}
	if (empNames[1]) {
		if (apprLineText) apprLineText += ' <i class="fas fa-caret-right" style="zoom:1.3; margin-left: 10px; margin-right: 10px; position:relative; top: 1px;"></i> ';
		apprLineText += `(${posNames[1]}) ${empNames[1]}`;
		document.getElementById('hiddenApprover2').value = addedApprovers[1];
	}
	if (empNames[2]) {
		if (apprLineText) apprLineText += ' <i class="fas fa-caret-right" style="zoom:1.3; margin-left: 10px; margin-right: 10px; position:relative; top: 1px;"></i> ';
		apprLineText += `(${posNames[2]}) ${empNames[2]}`;
		document.getElementById('hiddenApprover3').value = addedApprovers[2];
	}
	console.log("addedApprovers[0] : " + document.getElementById('hiddenApprover1').value);
	console.log("addedApprovers[1] : " + document.getElementById('hiddenApprover2').value);
	console.log("addedApprovers[2] : " + document.getElementById('hiddenApprover3').value);
	
	//alert('결재자1: '+ empNames[0] + ' 결재자2: ' + empNames[1] + ' 결재자3: ' + empNames[2]);
	
	apprLineBtn.innerHTML = apprLineText;
	
	// 모달 닫기
	const apprLineModal = document.getElementById('apprLineModal');
	const modal = bootstrap.Modal.getInstance(apprLineModal); // 기존 인스턴스 가져오기
	modal.hide(); // 모달 닫기
});
	

// 모달이 열릴 때 초기화
const apprLineModal = document.getElementById('apprLineModal');
apprLineModal.addEventListener('show.bs.modal', function () {
    // 선택된 템플릿 초기화
    if (selectedEmp) {
        selectedEmp.style.backgroundColor = ''; // 선택 해제
        selectedEmp = null;
    }

    // 모든 collapse를 닫음
    document.querySelectorAll('.collapse').forEach(collapse => {
        collapse.classList.remove('show');
    });
	
	
	// 초기화 로직
	const apprLineBtn = document.getElementById('apprLineBtn');
	if(apprLineBtn.innerText == '결재선 설정') {
		approverCount = 0;
		addedApprovers = [];
		empNames = [];
		posNames = [];
		$('.approverField').remove(); // 결재 라인 초기화
		$('.approverPlusBtn').show(); // 모든 + 버튼 다시 보이기
		
	}
	
	//input에 저장된 값 비우기
	document.getElementById('hiddenApprover1').value = "";
	document.getElementById('hiddenApprover2').value = "";	
	document.getElementById('hiddenApprover3').value = "";
	
});	

	
$('#apprLineModal').on('hidden.bs.modal', function () {
	

	
});
