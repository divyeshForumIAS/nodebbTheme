<div class="row">
	<div class="col-sm-4 col-md-3">
		<!-- IMPORT partials/flags/filters.tpl -->
	</div>
	<div class="col-sm-8 col-md-9">
		<h2>
			<div class="pull-right">
				<a class="btn btn-link" href="{config.relative_path}/flags"><i class="fa fa-chevron-left"></i> [[flags:back]]</a>
			</div>
			{target_readable}
			<small><span class="timeago" title="{datetimeISO}"></span></small>
		</h2>

		<hr />

		<!-- IF type_bool.post -->
		<div class="posts">
			<div class="postFlagged highlight">
				<div class="post-header">
					<a href="{config.relative_path}/user/{target.user.userslug}">
						<!-- IF target.user.picture -->
						<img class="media-object avatar avatar-lg" src="{target.user.picture}" alt="{target.user.username}" />
						<!-- ELSE -->
						<div class="media-object avatar avatar-lg" style="background-color: {target.user.icon:bgColor}">{target.user.icon:text}</div>
						<!-- ENDIF target.user.picture -->
					</a>
				</div>
				<div class="content">
					<h4 class="post-author"><a href="{config.relative_path}/user/{target.user.userslug}">{target.user.username}</a></h4>
					<div class="postContent">{target.content}</div>
				</div>
			</div>
		</div>
		<!-- ENDIF type_bool.post -->

		<!-- IF type_bool.user -->
		<div class="posts">
			<div class="postFlagged">
				<div class="post-header">
					<a href="{config.relative_path}/user/{target.userslug}">
						<!-- IF target.picture -->
						<img class="media-object avatar avatar-lg" src="{target.picture}" alt="{target.username}" />
						<!-- ELSE -->
						<div class="media-object avatar avatar-lg" style="background-color: {target.icon:bgColor}">{target.icon:text}</div>
						<!-- ENDIF target.picture -->
					</a>
				</div>
				<div class="content">
					<h4 class="post-author"><a href="{config.relative_path}/user/{target.userslug}">{target.username}</a></h4>
					<div class="postContent">
						<a href="{config.relative_path}/uid/{target.uid}">[[flags:user-view]]</a> |
						<a href="{config.relative_path}/uid/{target.uid}/edit">[[flags:user-edit]]</a>
					</div>
				</div>
			</div>
		</div>
		<!-- ENDIF type_bool.user -->

		<!-- IF type_bool.empty -->
		<div class="alert alert-warning">[[flags:target-purged]]</div>
		<!-- ENDIF type_bool.empty -->

		<hr />

		<div class="row">
			<div class="col-sm-6 col-md-8">
				<form role="form" id="attributes">
					<div class="panel panel-default previewFlag">
						<div class="panel-body">
							<div class="form-group row">
								<div class="col-sm-6">
									<label>[[flags:reporter]]</label>
									<div>
										<!-- IF reporter.picture -->
										<img class="media-object avatar avatar-sm" src="{reporter.picture}" alt="{reporter.username}" />
										<!-- ELSE -->
										<div class="media-object avatar avatar-sm" style="background-color: {reporter.icon:bgColor}">{reporter.icon:text}</div>
										<!-- ENDIF reporter.picture -->
										<a href="{config.relative_path}/user/{reporter.userslug}">{reporter.username}</a>
									</div>
								</div>
								<div class="col-sm-6">
									<label>[[flags:reported-at]]</label>
									<p>
										{datetimeISO}
									</p>
								</div>
							</div>
							<div class="form-group">
								<label>[[flags:description]]</label>
								<blockquote>{description}</blockquote>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="state">[[flags:state]]</label>
						<select class="form-control" id="state" name="state" disabled>
							<option value="open">[[flags:state-open]]</option>
							<option value="wip">[[flags:state-wip]]</option>
							<option value="resolved">[[flags:state-resolved]]</option>
							<option value="rejected">[[flags:state-rejected]]</option>
						</select>
					</div>
					<div class="form-group">
						<label for="assignee">[[flags:assignee]]</label>
						<select class="form-control" id="assignee" name="assignee" disabled>
							<option value="">[[flags:no-assignee]]</option>
							<!-- BEGIN assignees -->
							<option value="{../uid}">{../username}</option>
							<!-- END assignees -->
						</select>
					</div>
					<button type="button" class="btn btn-block btn-primary" data-action="update">[[flags:update]]</button>
				</form>

				<hr />

				<form role="form">
					<div class="form-group">
						<label for="note">[[flags:notes]]</label>
						<textarea id="note" class="form-control"></textarea>
					</div>
					<button type="button" class="btn btn-block btn-primary" data-action="appendNote">[[flags:add-note]]</button>
				</form>

				<div class="posts flagNotes">
					<ul>
						<!-- IF !notes.length -->
						<div class="alert alert-success text-center">[[flags:no-notes]]</div>
						<!-- ELSE -->
						<div component="flag/notes">
							<!-- BEGIN notes -->
							<div class="postFlagged">
								<div class="post-header">
									<a href="{config.relative_path}/user/{../user.userslug}">
										<!-- IF ../user.picture -->
										<img class="media-object avatar avatar-lg" src="{../user.picture}" alt="{../user.username}" />
										<!-- ELSE -->
										<div class="media-object avatar avatar-lg" style="background-color: {../user.icon:bgColor}">{../user.icon:text}</div>
										<!-- ENDIF ../user.picture -->
									</a>
								</div>
								<div class="content">
									<h4 class="post-author">
										<a href="{config.relative_path}/user/{../user.userslug}">{../user.username}</a>
										<small><span class="timeago" title="{../datetimeISO}"></span></small>
									</h4>
									<div class="postContent">{../content}</div>
								</div>
							</div>
							<!-- END notes -->
						</div>
						<!-- ENDIF !notes.length -->
					</ul>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">[[flags:quick-links]]</h3>
					</div>
					<div class="panel-body">
						<ul class="ulFixBottom">
							<li><a href="{config.relative_path}/{type_path}/{targetId}">[[flags:go-to-target]]</a></li>
							<li>
								<h5>[[flags:flagged-user]]</h5>
								<ul>
									<li><a href="{config.relative_path}/uid/{target.uid}">[[flags:view-profile]]</a></li>
									<!-- IF !config.disableChat -->
									<li><a href="#" data-chat="{target.uid}">[[flags:start-new-chat]]</a></li>
									<!-- ENDIF !config.disableChat -->
								</ul>
							</li>
							<li>
								<h5>[[flags:reporter]]</h5>
								<ul>
									<li><a href="{config.relative_path}/uid/{reporter.uid}">[[flags:view-profile]]</a></li>
									<!-- IF !config.disableChat -->
									<li><a href="#" data-chat="{reporter.uid}">[[flags:start-new-chat]]</a></li>
									<!-- ENDIF !config.disableChat -->
								</ul>
							</li>
						</ul>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">[[flags:history]]</h3>
					</div>
					<div class="panel-body">
						<ul component="flag/history" class="ulFixBottom">
							<!-- IF !history.length -->
							<div class="alert alert-success text-center">[[flags:no-history]]</div>
							<!-- ENDIF !history.length -->
						
							<!-- BEGIN history -->
							<li class="media">
								<div class="media-left">
									<a href="{config.relative_path}/user/{../user.userslug}">
										<!-- IF ../user.picture -->
										<img class="media-object avatar avatar-md" src="{../user.picture}" alt="{../user.username}" />
										<!-- ELSE -->
										<div class="media-object avatar avatar-md" style="background-color: {../user.icon:bgColor}">{../user.icon:text}</div>
										<!-- ENDIF ../user.picture -->
									</a>
								</div>
								<div class="media-body">
									<h4 class="media-heading">
										<a href="{config.relative_path}/user/{../user.userslug}">{../user.username}</a>
										<small><span class="timeago" title="{../datetimeISO}"></span></small>
									</h4>
									<ul>
										<!-- BEGIN fields -->
										<li>
											<span class="label label-primary">[[flags:@key]]</span><!-- IF @value --> &rarr; <span class="label label-default">@value</span><!-- ENDIF @value -->
										</li>
										<!-- END fields -->
									</ul>
								</div>
							</li>
							<!-- END history -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>