var MemberEditable = function () {

    var handleTable = function () {

        function restoreRow(oTable, nRow) {
            var aData = oTable.fnGetData(nRow);
            var jqTds = $('>td', nRow);

            for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                oTable.fnUpdate(aData[i], nRow, i, false);
            }

            oTable.fnDraw();
        }

        function editRow(oTable, nRow) {
            //var aData = oTable.fnGetData(nRow);
            var jqTds = $('>td', nRow);
            jqTds[3].innerHTML = '<select><option>administrator</option><option>member</option></select>';
            jqTds[4].innerHTML = '<a class="edit label label-sm label-success" href="">Save</a>';
            jqTds[5].innerHTML = '<a class="cancel label label-sm label-default" href="">Cancel</a>';
        }

        function saveRow(oTable, nRow) {
            var jqSelected = $('option:selected', nRow);
            oTable.fnUpdate(jqSelected[0].value, nRow, 3, false);
            oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 4, false);
            oTable.fnUpdate('<a class="delete" href="">Delete</a>', nRow, 5, false);
            oTable.fnDraw();
            
            var jqTds = $('td', nRow);
            var selectedUserId = jqTds[1].innerHTML;
            var selectedRole = jqSelected[0].value;
            
            console.log("update group => " + group);
            console.log("update id => " + jqTds[1].innerHTML);
            console.log("update role => " + jqSelected[0].value);
            
            updateUserGroupRole(group, selectedUserId, selectedRole);
        }

        var table = $('#member_table');

        var oTable = table.dataTable({

            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
            // So when dropdowns used the scrollable div should be removed. 
            //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

            "lengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "All"] // change per page values here
            ],

            // Or you can use remote translation file
            //"language": {
            //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
            //},

            // set the initial value
            "pageLength": 10,

            "language": {
                "lengthMenu": " _MENU_ records"
            },
            "columns": [{
                "orderable": true
            }, {
                "orderable": true
            }, {
                "orderable": true
            }, {
                "orderable": true
            }, {
                "orderable": false
            }, {
                "orderable": false
            }],
            "columnDefs": [{ // set default column settings
                'orderable': true,
                'targets': [0]
            }, {
                "searchable": true,
                "targets": [0]
            }],
            "bFilter" : false,               
            "bLengthChange": false,
            "order": [
                [0, "asc"]
            ] // set first column as a default sort by asc
        });

        var tableWrapper = $("#member_table_wrapper");

        tableWrapper.find(".dataTables_length select").select2({
            showSearchInput: true //hide search box with special css class
        }); // initialize select2 dropdown

        var nEditing = null;

        $('#member_table_new').click(function (e) {
            e.preventDefault();
            
            console.log("ADD");
        });

        table.on('click', '.delete', function (e) {
            e.preventDefault();

            if (confirm("Are you sure to delete this row ?") == false) {
                return;
            }

            var nRow = $(this).parents('tr')[0];
            //oTable.fnDeleteRow(nRow);
            console.log("DELETE");
            
            var jqTds = $('td', nRow);
            var deleteUserId = jqTds[1].innerHTML;
            var deleteEmail = jqTds[2].innerHTML;
            
            deleteGroupMember(group, deleteUserId, deleteEmail);
        });

        table.on('click', '.cancel', function (e) {
            e.preventDefault();

            restoreRow(oTable, nEditing);
            nEditing = null;
        });

        table.on('click', '.edit', function (e) {
            e.preventDefault();

            /* Get the row as a parent of the link that was clicked on */
            var nRow = $(this).parents('tr')[0];

            if (nEditing !== null && nEditing != nRow) {
                /* Currently editing - but not this row - restore the old before continuing to edit mode */
                restoreRow(oTable, nEditing);
                editRow(oTable, nRow);
                nEditing = nRow;
            } else if (nEditing == nRow && this.innerHTML == "Save") {
                /* Editing this row and want to save it */
                saveRow(oTable, nEditing);
                nEditing = null;
            } else {
                /* No edit in progress - let's start one */
                editRow(oTable, nRow);
                nEditing = nRow;
            }
        });
        
      //사용자 그룹 권한 변경
		function updateUserGroupRole(group, userid, role) {
			$.blockUI({ message: null });
			var url = updateGroupRole;
			var param = {
					group : group,
					userid : userid,
					role : role
			};
		
			$.ajax({
				type : "POST",
				url : url,
				data : param,
				success : function(data) {
					console.log(data);
					location.href = group_settings_manage + "?group=" + group;
				},
				error : function(e) {
					console.log(e.responseText);
					$.unblockUI();
				}
			});
		}
		
		//그룹 사용자 삭제
		function deleteGroupMember(group, userid, email) {
			$.blockUI({ message: null });
			var url = deleteGroupMemberUrl;
			var param = {
					group : group,
					userId : userid,
					email : email
			};
		
			$.ajax({
				type : "DELETE",
				url : url,
				data : param,
				data : JSON.stringify(param),
				contentType: "application/json; charset=utf-8",				
				success : function(data) {
					result = eval('(' + data + ')');
					console.log(result);
					location.href = group_settings_manage + "?group=" + group;
				},
				error : function(e) {
					console.log(e.responseText);
					$.unblockUI();
				}
			});
		}
    };

    return {

        //main function to initiate the module
        init: function () {
            handleTable();
        }

    };

}();