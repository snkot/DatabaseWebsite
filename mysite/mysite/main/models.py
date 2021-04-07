# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.utils import timezone


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Comments(models.Model):
    #id = models.IntegerField(primary_key=True)
    content = models.TextField(blank=True, null=True)
    rating = models.IntegerField()
    time = models.TimeField()
    iduser = models.ForeignKey('Users', models.DO_NOTHING, db_column='idUser')  # Field name made lowercase.
    text = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'comments'


class Dashboards(models.Model):
    #id = models.IntegerField(primary_key=True)
    views = models.IntegerField()
    rating = models.IntegerField()
    downloads = models.IntegerField()
    revenue = models.DecimalField(max_digits=65535, decimal_places=65535)
    idproject = models.ForeignKey('Projects', models.DO_NOTHING, db_column='idProject')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'dashboards'


class Devlogs(models.Model):
    #id = models.IntegerField(primary_key=True)
    theme = models.CharField(max_length=255)
    rating = models.IntegerField()
    date = models.DateTimeField()
    idpost = models.ForeignKey('Posts', models.DO_NOTHING, db_column='idPost')  # Field name made lowercase.
    idproject = models.ForeignKey('Projects', models.DO_NOTHING, db_column='idProject')  # Field name made lowercase.
    idcomment = models.ForeignKey(Comments, models.DO_NOTHING, db_column='idComment', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'devlogs'


class Discussions(models.Model):
    #id = models.IntegerField(primary_key=True)
    theme = models.CharField(max_length=255)
    marks = models.CharField(max_length=255, blank=True, null=True)
    date = models.TimeField()
    idpost = models.ForeignKey('Posts', models.DO_NOTHING, db_column='idPost')  # Field name made lowercase.
    idcomment = models.ForeignKey(Comments, models.DO_NOTHING, db_column='idComment', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'discussions'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Donations(models.Model):
    #id = models.IntegerField(primary_key=True)
    sum = models.DecimalField(max_digits=999, decimal_places=2)
    comment = models.CharField(max_length=255, blank=True, null=True)
    date = models.DateTimeField()
    iduser = models.ForeignKey('Users', models.DO_NOTHING, db_column='idUser')  # Field name made lowercase.
    idproject = models.ForeignKey('Projects', models.DO_NOTHING, db_column='idProject')  # Field name made lowercase.

    def save(self, *args, **kwargs):
        ''' On save, update timestamps '''
        if not self.id:
            self.date = timezone.now()
            self.iduser = Users.objects.get(id=47)
        return super(Donations, self).save(*args, **kwargs)

    def __str__(self):
        return str(self.sum)

    class Meta:
        managed = False
        db_table = 'donations'


class Libraries(models.Model):
    #id = models.IntegerField(primary_key=True)
    favorites = models.CharField(max_length=255, blank=True, null=True)
    purchases = models.CharField(max_length=255, blank=True, null=True)
    iduser = models.ForeignKey('Users', models.DO_NOTHING, db_column='idUser')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'libraries'


class Posts(models.Model):
    #id = models.IntegerField(primary_key=True)
    content = models.TextField(blank=True, null=True)
    iduser = models.ForeignKey('Users', models.DO_NOTHING, db_column='idUser')  # Field name made lowercase.
    text = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'posts'


class Projectpages(models.Model):
    #id = models.IntegerField(primary_key=True)
    url = models.CharField(db_column='URL', max_length=255)  # Field name made lowercase.
    description = models.CharField(max_length=255, blank=True, null=True)
    preview = models.CharField(max_length=255, blank=True, null=True)
    screenshot = models.CharField(max_length=255, blank=True, null=True)
    trailer = models.CharField(max_length=255, blank=True, null=True)
    idcomment = models.ForeignKey(Comments, models.DO_NOTHING, db_column='idComment', blank=True, null=True)  # Field name made lowercase.
    idproject = models.ForeignKey('Projects', models.DO_NOTHING, db_column='idProject')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'projectPages'


class Projecttolibrary(models.Model):
    #id = models.IntegerField(primary_key=True)
    idproject = models.ForeignKey('Projects', models.DO_NOTHING, db_column='idProject', blank=True, null=True)  # Field name made lowercase.
    idlibrary = models.ForeignKey(Libraries, models.DO_NOTHING, db_column='idLibrary')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'projectToLibrary'


class Projects(models.Model):
    #id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255)
    marks = models.CharField(max_length=255, blank=True, null=True)
    content = models.CharField(max_length=255)
    cost = models.DecimalField(max_digits=65535, decimal_places=65535)
    releasedate = models.TimeField(db_column='releaseDate')  # Field name made lowercase.
    iduser = models.ForeignKey('Users', models.DO_NOTHING, db_column='idUser')  # Field name made lowercase.

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'projects'


class Role(models.Model):
    #id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255)
    access = models.IntegerField()

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'role'


class Users(models.Model):
    #id = models.IntegerField(primary_key=True)
    login = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=255, blank=True, null=True)
    avatar = models.CharField(max_length=255, blank=True, null=True)
    contact = models.CharField(max_length=255, blank=True, null=True)
    idrole = models.ForeignKey(Role, models.DO_NOTHING, db_column='idRole')  # Field name made lowercase.

    def __str__(self):
        return self.login

    class Meta:
        managed = False
        db_table = 'users'
