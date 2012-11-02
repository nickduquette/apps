###
# ownCloud - News app
#
# @author Bernhard Posselt
# Copyright (c) 2012 - Bernhard Posselt <nukeawhale@gmail.com>
#
# This file is licensed under the Affero General Public License version 3 or later.
# See the COPYING-README file
#
###

angular.module('News').factory 'PersistenceNews', 
['Persistence', '$http', '$rootScope', 
(Persistence, $http, $rootScope) ->

	class PersistenceNews extends Persistence

		constructor: ($http, $rootScope) ->
			super('news', $http)


		loadInitial: () ->
			@post 'init', {}, (json) ->
				console.log json


		markRead: (itemId, isRead) ->
			if isRead
				status = 'read'
			else
				status = 'unread'

			data =
				itemId: itemId
				status: status

			@post 'setitemstatus', data


		setImportant: (itemId, isImportant) ->
			if isImportant
				status = 'important'
			else
				status = 'unimportant'

			data =
				itemId: itemId
				status: status

			@post 'setitemstatus', data


		collapseFolder: (folderId, value) ->
			data =
				folderId: folderId
				opened: value
			@post 'collapsefolder', data


	return new PersistenceNews($http, $rootScope)
]