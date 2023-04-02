from django.db import models

# Create your models here.

class tbl_expert(models.Model):
    expert_id = models.CharField(primary_key=True, max_length=30)
    expert_name=models.CharField(max_length=30)
    address=models.CharField(max_length=100)
    gender=models.CharField(max_length=100)
    dob=models.CharField(max_length=100)
    qualification=models.CharField(max_length=100)
    experience=models.CharField(max_length=100)
    description=models.CharField(max_length=100)
    category=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    email=models.CharField(max_length=30)
    photo=models.CharField(max_length=30)
    adhar=models.CharField(max_length=100)
    status=models.CharField(max_length=30)
    class Meta:
        db_table="tbl_expert"

class tbl_idgen(models.Model):
    eid = models.IntegerField()
    qid = models.IntegerField()
    userid = models.IntegerField()
    article_id = models.IntegerField()
    video_id=models.IntegerField()
    query_id=models.IntegerField()
    review_id=models.IntegerField()
    book_id=models.IntegerField()
    webinar_id=models.IntegerField()
    test_id=models.IntegerField()
    event_id=models.IntegerField()
    
    class Meta:
        db_table = "tbl_idgen"

class tbl_login(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    category = models.CharField(max_length=100)

    class Meta:
        db_table ="tbl_login"


class tbl_question(models.Model):
    question_no = models.CharField(primary_key=True, max_length=30)
    question =models.CharField(max_length=100)
    status=models.CharField(max_length=100)
    
    class Meta:
        db_table = "tbl_question"

class tbl_user(models.Model):
    user_id = models.CharField(primary_key=True, max_length=30)
    user_name=models.CharField(max_length=30)
    address=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    email=models.CharField(max_length=30)
    category=models.CharField(max_length=100)
    
    class Meta:
        db_table="tbl_user"

class tbl_article(models.Model):
    article_id = models.CharField(primary_key=True, max_length=30)
    expert_id=models.ForeignKey(tbl_expert, on_delete=models.CASCADE)
    uploaded_date=models.CharField(max_length=100)
    article=models.CharField(max_length=100)
    
    class Meta:
        db_table="tbl_article"

class tbl_video(models.Model):
    video_id = models.CharField(primary_key=True, max_length=30)
    expert_id=models.ForeignKey(tbl_expert, on_delete=models.CASCADE)
    uploaded_date=models.CharField(max_length=100)
    category=models.CharField(max_length=100)
    video=models.CharField(max_length=100)
    
    class Meta:
        db_table="tbl_video"

class tbl_query(models.Model):
    query_id = models.CharField(primary_key=True, max_length=30)
    user_id=models.ForeignKey(tbl_user, on_delete=models.CASCADE)
    date=models.CharField(max_length=100)
    status=models.CharField(max_length=100)
    query=models.CharField(max_length=100)
    queryanswer=models.CharField(max_length=100)
    
    class Meta:
        db_table="tbl_query"

class tbl_review(models.Model):
    review_id = models.CharField(primary_key=True, max_length=30)
    user_id=models.ForeignKey(tbl_user, on_delete=models.CASCADE)
    expert_id=models.ForeignKey(tbl_expert, on_delete=models.CASCADE)
    reviewdate=models.CharField(max_length=100)
    review=models.CharField(max_length=100)
    
    class Meta:
        db_table="tbl_review"

class tbl_bookexpert(models.Model):
    booking_id = models.CharField(primary_key=True, max_length=30)
    user_id=models.ForeignKey(tbl_user, on_delete=models.CASCADE)
    expert_id=models.ForeignKey(tbl_expert, on_delete=models.CASCADE)
    bookingdate=models.CharField(max_length=100)
    bookingtime=models.CharField(max_length=100)
    status=models.CharField(max_length=100)
    
    class Meta:
        db_table="tbl_bookexpert"

class tbl_webinar(models.Model):
    webinar_id = models.CharField(primary_key=True, max_length=30)
    expert_id=models.ForeignKey(tbl_expert, on_delete=models.CASCADE)
    webinardate=models.CharField(max_length=100)
    Topic=models.CharField(max_length=100)
    status=models.CharField(max_length=100)
    
    class Meta:
        db_table="tbl_webinar"

class tbl_result(models.Model):
    test_no = models.CharField(primary_key=True, max_length=30)
    user_id=models.ForeignKey(tbl_user, on_delete=models.CASCADE)
    score=models.CharField(max_length=100)
    date=models.CharField(max_length =100)
    interference=models.CharField(max_length=100)
    
    class Meta:
        db_table="tbl_result"

class tbl_event(models.Model):
    event_id = models.CharField(primary_key=True, max_length=30)
    event=models.CharField(max_length=100)
    photo=models.CharField(max_length=100)
    event_date=models.CharField(max_length =100)
    status=models.CharField(max_length=100)
    
    class Meta:
        db_table="tbl_event"





