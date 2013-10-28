
Pod::Spec.new do |s|

	s.name				= 'RSErrorKit'
	s.version			= '0.0.1'
	s.summary			= 'Framework for handling NSError on iOS'
	s.homepage			= 'https://github.com/dmeehan1968/RSErrorKit'
	s.license			= {
		:type => 'MIT',
		:file => 'LICENSE'
	}
	s.author			= {
		'Dave Meehan' => 'dave_meehan@replicated.co.uk'
	}
	s.source			= {
		:git => 'https://github.com/dmeehan1968/RSErrorKit.git',
		:tag => s.version.to_s
	}
	s.source_files		= 'RSErrorKit/*.{m,h}'
	s.requires_arc		= true

end