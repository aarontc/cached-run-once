require 'cached_run_once/version'

module CachedRunOnce
	def cached_run_once
		@_cached_run_once_methods ||= {}
		label = caller_locations(1, 1)[0].label
		unless @_cached_run_once_methods.has_key? label
			result = yield
			@_cached_run_once_methods[label] = result
		end
		@_cached_run_once_methods[label]
	end
end
