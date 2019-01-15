Creator.Objects.project_issues =
	name: "project_issues"
	label: "问题"
	icon: "location"
	enable_files: true
	enable_search: true
	enable_instances: true
	fields:
		name:
			label: '标题'
			type: 'text'
			is_wide: true
			required: true
			searchable: true

		description:
			label: '问题描述'
			type: 'textarea'
			is_wide: true
			rows: 4

		category:
			label: '分类'
			type: 'master_detail'
			reference_to: 'projects'
			filterable: true

		level:
			label: "级别"
			type: "select"
			options: [
				{label:"车间级", value:"department"},
				{label:"厂级", value:"company"},
				{label:"公司级", value:"group"}
			]
			sortable: true
			defaultValue: "department"
			filterable: true

		company_id:
			label: '提报单位'
			type: 'lookup'
			reference_to: 'organizations'
			filterable: true

		organization:
			label: '提报部门'
			type: 'lookup'
			reference_to: 'organizations'
			filterable: true


		tags:
			label: '标签'
			type: 'lookup'
			reference_to: 'project_tags'
			multiple: true
			filterable: true

		# priority:
		# 	label: '优先级'
		# 	type: "select"
		# 	options: [
		# 		{label:"高", value:"high"},
		# 		{label:"中", value:"medium"},
		# 		{label:"低", value:"low"}
		# 	]
		# 	defaultValue: "medium"
		# 	filterable: true

		owner:
			label: '责任人'
			type: 'lookup'
			reference_to: 'users'
			hidden: false
			omit: false
			required: false

		deadline:
			label: '截止时间'
			type: 'datetime'

		# owner_organization:
		# 	label: '责任部门'
		# 	type: 'lookup'
		# 	reference_to: 'organizations'
		# 	required: true

		# state:
		# 	label: "进度"
		# 	type: "select"
		# 	options: [
		# 		{label:"待确认", value:"pending_confirm"},
		# 		{label:"处理中", value:"in_progress"},
		# 		{label:"暂停", value:"paused"},
		# 		{label: "已完成", value:"completed"}
		# 		{label: "已取消", value:"cancelled"}
		# 	]
		# 	sortable: true
		# 	required: true
		# 	filterable: true

		status:
			label: "状态"
			type: "select"
			options: [
				{label:"进行中", value:"open"},
				{label:"已关闭", value:"closed"}
			]
			defaultValue: "open"
			filterable: true

		solution:
			label: '拟上措施'
			type: 'textarea'
			is_wide: true
			rows: 4

		# investment_amount:
		# 	label: '投资估算(万元)'
		# 	type: 'number'
		# 	group: "投资"

		# investment_channel:
		# 	label: '投资渠道'
		# 	type: 'text'
		# 	group: "投资"

		# investment_forcast:
		# 	label: '预期效果'
		# 	type: 'textarea'
		# 	is_wide: true
		# 	group: "投资"

		# investment_profit:
		# 	label: '效益测算(万元)'
		# 	type: 'number'
		# 	group: "投资"

		# invertment_date:
		# 	label: '预计实施时间'
		# 	type: 'date'
		# 	group: "投资"


		created_by:
			label: '提报人'


	list_views:
		open:
			label: "进行中"
			columns: ["name", "category", "level", "tags", "created"]
			filter_scope: "space"
			filters: [["status", "=", "open"]]
			filter_fields: ["category", "level", "tags", "company_id", "owner", "created_by"]
		closed:
			label: "已关闭"
			columns: ["name", "category", "level", "tags", "created"]
			filter_scope: "space"
			filters: [["status", "=", "closed"]]
			filter_fields: ["category", "level", "tags", "company_id", "owner", "created_by"]
		all:
			label: "所有"
			columns: ["name", "category", "level", "status", "tags", "created"]
			filter_scope: "space"
			filter_fields: ["category", "level", "status", "tags", "company_id", "owner", "created_by"]


	permission_set:
		user:
			allowCreate: true
			allowDelete: true
			allowEdit: true
			allowRead: true
			modifyAllRecords: false
			viewAllRecords: true
		admin:
			allowCreate: true
			allowDelete: true
			allowEdit: true
			allowRead: true
			modifyAllRecords: true
			viewAllRecords: true