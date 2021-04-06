from django.contrib import admin
from .models import Comments
from .models import Dashboards
from .models import Devlogs
from .models import Discussions
from .models import Donations
from .models import Libraries
from .models import Posts
from .models import Projectpages
from .models import Projects
from .models import Role
from .models import Users


admin.site.register(Comments)
admin.site.register(Dashboards)
admin.site.register(Devlogs)
admin.site.register(Discussions)
admin.site.register(Donations)
admin.site.register(Libraries)
admin.site.register(Posts)
admin.site.register(Projectpages)
admin.site.register(Projects)
admin.site.register(Role)
admin.site.register(Users)