---
layout: page
title: Our Fantastic Community!
---

<section>
	<h1>Hall of Fame</h1>

	<div class="hall-of-fame">
		{% for person in site.data.instructors %}
			{% if person[0] != "awspolly" %}
			{% assign username = person[0] %}
			<div class="hall-of-fame-hero" id="{{ username }}">

				<img src="https://avatars.githubusercontent.com/{{ username }}" alt="{{ username }}">

				<div class="name">
					{{ person[1].name | default: username }}
				</div>
				<div class="affil">
				{% assign affil = person[1].affiliation %}
					<a href="{{ site.data.affiliations[affil].link }}">
						{{ site.data.affiliations[affil].name }}
					</a>
				</div>
			</div>
			{% endif %}
		{% endfor %}
	</div>
</section>
