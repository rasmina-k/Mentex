from django.shortcuts import render,redirect
from mentalapp.models import tbl_idgen,tbl_expert,tbl_question,tbl_login,tbl_user,tbl_article,tbl_video,tbl_query,tbl_review,tbl_bookexpert,tbl_webinar,tbl_result,tbl_event
from django.core.files.storage import FileSystemStorage
from datetime import datetime,date

def index(request):
    return render(request,'index.html')
def form(request):
    return render(request,'form.html')
def menubar(request):
    return render(request,'menubar.html')
def adminmenu(request):
    return render(request,'adminmenu.html')
def publicmember(request):
    return render(request,'publicmenu.html')
def semenu(request):
    return render(request,'usersexeducationmenu.html')
def mamenu(request):
    return render(request,'usermentalabilitymenu.html')
def esemenu(request):
    return render(request,'expsexeducationmenu.html')
def emamenu(request):
    return render(request,'expmentalabilitymenu.html')
def table(request):
    return render(request,"table.html")



def userse(request):
    return render(request,'usersexeducation.html')
def userma(request):
    return render(request,'usermentalability.html')

def login(request):
    return render(request,"login.html")

def login1(request):
     if request.method == 'POST':
        data=tbl_login.objects.all()
        un=request.POST.get('username')
        pwd=request.POST.get('password')

        flag=0

        for da in data:
            if un == da.username and pwd == da.password:
                type=da.category
                flag=1
                if type=="ADMIN":
                    request.session['adm']=un
                    return redirect('/admin')
                elif type=="EXPERT":
                    request.session['expert']=un
                    return redirect('/expert')
                elif type=="USER":
                    request.session['user']=un
                    return redirect('/user')
                else:
                    return render(request,"login.html")
        if flag==0:
            return render(request,"login.html")
    
def adminlogout(request):
    del request.session['adm']
    return render(request,'login.html')

def expertlogout(request):
    del request.session['expert']
    return render(request,'login.html')

def userlogout(request):
    del request.session['user']
    return render(request,'login.html')

def admin(request):
    if 'adm' not in request.session:
        return redirect(request,'/index')
    else:
        return render(request,'admin.html') 

def addexpert(request):
    if 'adm' not in request.session:
        return redirect(request,'/index')
    else:
        data=tbl_idgen.objects.get(id=1)
        s1 = data.eid
        s1 = int(s1+1)
        eid="EXP_00"+str(s1)
        request.session['s'] =s1
        return render(request,'addexpert.html',{'eid':eid})

def addexpert1(request):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        if request.method=="POST":
            data = tbl_expert()
            data.expert_id= request.POST.get("id")
            data.expert_name= request.POST.get("name")
            data.address= request.POST.get("address")
            data.gender= request.POST.get("gender")
            data.dob= request.POST.get("dob")
            data.qualification= request.POST.get("qualification")
            data.description= request.POST.get("description")
            data.experience=request.POST.get("experience")
            data.category=request.POST.get("category")
            data.phone= request.POST.get("phone")
            data.email= request.POST.get("email")
            data.adhar= request.POST.get("adhar")
            data.status= "VERIFIED"
            Photo = request.FILES['image']
            fs = FileSystemStorage()
            filename = fs.save(Photo.name, Photo)
            uploaded_file_url = fs.url(filename)
            data.photo=uploaded_file_url
            data.save()

            data1= tbl_idgen.objects.get(id=1)
            eid=request.session['s']
            data1.eid = eid
            data1.save()

            data2= tbl_login()
            data2.username = data.expert_id
            data2.password  = data.phone
            data2.category = "EXPERT"
            data2.save()

            return redirect('/addexpert')

def removeexpert(request):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.filter(status="VERIFIED")
        return render(request,"viewexpert.html",{'data1':data})


def delexpert(request,id):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.get(expert_id=id)
        data.delete()
        return redirect('/removeexpert')

def updateexpert(request):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.filter(status="VERIFIED")
        return render(request,"viewexpert1.html",{'data1':data})


def updexpert(request,id):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.get(expert_id=id)
        return render(request,"updateexpert.html",{'data':data})

def updateexpert1(request,id):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert .objects.get(expert_id=id)
        if request.method=='POST':
            data.phone= request.POST.get("phone")
            data.email= request.POST.get("email")
            data.save()

            data2= tbl_login.objects.get(username=id)
            data2.password  = data.phone
            data2.save()
        return redirect('/updateexpert')


def expertreg(request):
    data=tbl_idgen.objects.get(id=1)
    s1 = data.eid
    s1 = int(s1+1)
    eid="EXP_00"+str(s1)
    request.session['s'] =s1
    return render(request,'expertreg.html',{'eid':eid})

def expertreg1(request):
    if request.method=="POST":
        data = tbl_expert()
        data.expert_id= request.POST.get("id")
        data.expert_name= request.POST.get("name")
        data.address= request.POST.get("address")
        data.gender= request.POST.get("gender")
        data.dob= request.POST.get("dob")
        data.qualification= request.POST.get("qualification")
        data.description= request.POST.get("description")
        data.experience=request.POST.get("experience")
        data.category=request.POST.get("category")
        data.phone= request.POST.get("phone")
        data.email= request.POST.get("email")
        data.adhar= request.POST.get("adhar")
        data.status= "NOT VERIFIED"
        Photo = request.FILES['image']
        fs = FileSystemStorage()
        filename = fs.save(Photo.name, Photo)
        uploaded_file_url = fs.url(filename)
        data.photo=uploaded_file_url
        data.save()

        data1= tbl_idgen.objects.get(id=1)
        eid=request.session['s']
        data1.eid = eid
        data1.save()

        return redirect('/index')


def verifyexpert(request):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.filter(status="NOT VERIFIED")
        return render(request,'viewexpert2.html',{'data':data})

def acceptexpert(request,id):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.get(expert_id=id)
        data.status="VERIFIED"
        data.save()

        data2= tbl_login()
        data2.username = data.expert_id
        data2.password  = data.phone
        data2.category = "EXPERT"
        data2.save()

        return redirect('/verifyexpert')

def rejectexpert(request,id):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.get(expert_id=id)
        data.status="REJECTED"
        data.save()
        return redirect('/verifyexpert')

def addquestion(request):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_idgen.objects.get(id=1)
        s1 = data.qid
        s1 = int(s1+1)
        qid="QUE_00"+str(s1)
        request.session['s'] =s1
        return render(request,'addquestion.html',{'qid':qid})

def add_question(request):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        if request.method=="POST":
            data=tbl_question()
            data.question_no=request.POST.get("queno")
            data.question=request.POST.get("que")
            data.status="PENDING"
            data.save()

            data1=tbl_idgen.objects.get()
            qid=request.session['s']
            data1.qid = qid
            data1.save()
            return redirect('/addquestion')

def removequestion(request):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_question.objects.all()
        return render(request,"viewquestion.html",{'data1':data})


def remove_question(request,id):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_question.objects.get(question_no=id)
        data.delete()
        return redirect('/removequestion')

def userreg(request):
    data=tbl_idgen.objects.get(id=1)
    s1 = data.userid
    s1 = int(s1+1)
    uid="USER_00"+str(s1)
    request.session['s'] =s1
    return render(request,"userreg.html",{'userid':uid})

def userreg1(request):
    if request.method=="POST":
        data=tbl_user()
        data.user_id= request.POST.get("userid")
        data.user_name= request.POST.get("username")
        data.address= request.POST.get("address")
        data.phone= request.POST.get("phone")
        data.email= request.POST.get("email")
        data.category=request.POST.get("category")
        data.save()

        data1= tbl_idgen.objects.get(id=1)
        uid=request.session['s']
        data1.userid = uid
        data1.save()

        data2 =tbl_login()
        data2.username=data.user_id
        data2.password=data.phone
        data2.category="USER"
        data2.save()
        return redirect('/index')

def expert(request):
    if 'expert' not in request.session:
        return redirect(request,'/index')
    else:
        data=tbl_expert.objects.get(expert_id=request.session['expert'])
        if data.category == "Mental_Ability":
            return render(request,"expmentalability.html")
        else:
            return render(request,"expsexeducation.html")

def add_article(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_idgen.objects.get(id=1)
        s1 = data.article_id
        s1 = int(s1+1)
        aid="ART_00"+str(s1)
        request.session['s'] =s1
        data1=tbl_expert.objects.get(expert_id=request.session['expert'])
        return render(request,"addarticle.html",{'article_id':aid,'data':data1})

def addarticle(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        today = date.today()
        if request.method=="POST":
            data = tbl_article()
            data.article_id= request.POST.get("articleid")
            data.expert_id_id= request.POST.get("expertid")
            data.uploaded_date= today
            Photo = request.FILES['article']
            fs = FileSystemStorage()
            filename = fs.save(Photo.name, Photo)
            uploaded_file_url = fs.url(filename)
            data.article=uploaded_file_url
            data.save()

            data1= tbl_idgen.objects.get(id=1)
            aid=request.session['s']
            data1.article_id = aid
            data1.save()

            return render(request,"expsexeducation.html")

def removearticle(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_article.objects.filter(expert_id=request.session['expert'])
        return render(request,"viewarticle.html",{'data':data})

def remove_article(request,id):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_article.objects.get(article_id=id)
        data.delete()
    return render(request,"expsexeducation.html")

def add_video(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_idgen.objects.get(id=1)
        s1 = data.video_id
        s1 = int(s1+1)
        vid="VID_00"+str(s1)
        request.session['s'] =s1
        data1=tbl_expert.objects.get(expert_id=request.session['expert'])
        return render(request,"addvideo.html",{'video_id':vid,'data':data1})

def addvideo(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        today = date.today()
        if request.method=="POST":
            data = tbl_video()
            data.video_id= request.POST.get("videoid")
            data.expert_id_id= request.POST.get("expertid")
            data1=tbl_expert.objects.get(expert_id=request.POST.get("expertid"))
            data.category=data1.category
            data.uploaded_date= today
            Photo = request.FILES['video']
            fs = FileSystemStorage()
            filename = fs.save(Photo.name, Photo)
            uploaded_file_url = fs.url(filename)
            data.video=uploaded_file_url
            data.save()

            data2= tbl_idgen.objects.get(id=1)
            vid=request.session['s']
            data2.video_id = vid
            data2.save()

            return render(request,"expsexeducation.html")


def remove_video(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_video.objects.filter(expert_id=request.session['expert'])
        return render(request,"viewvideo.html",{'data':data})

def removevideo(request,id):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_video.objects.get(video_id=id)
        data.delete()
    return render(request,"expsexeducation.html")

def user(request):
    if 'user' not in request.session:
        return redirect(request,'/index')
    else:
        data=tbl_user.objects.get(user_id=request.session['user'])
        if data.category == "Mental_Ability":
            return render(request,"usermentalability.html")
        else:
            return render(request,"usersexeducation.html")


def generatequery(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_idgen.objects.get(id=1)
        s1 = data.query_id
        s1 = int(s1+1)
        qid="QUERY_00"+str(s1)
        request.session['s'] =s1
        data1=tbl_user.objects.get(user_id=request.session['user'])
        return render(request,"generatequery.html",{'query_id':qid,'data':data1})

def addquery(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        today = date.today()
        if request.method=="POST":
            data = tbl_query()
            data.query_id= request.POST.get("queryid")
            data.user_id_id= request.POST.get("userid")
            data.query=request.POST.get("query")
            data.queryanswer="NULL"
            data.date= today
            data.status="PENDING"
            data.save()

            data1= tbl_idgen.objects.get(id=1)
            qid=request.session['s']
            data1.query_id = qid
            data1.save()

            return render(request,"usersexeducation.html")

def viewquery(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_query.objects.all()
        return render(request,"viewquery.html",{'data':data})    

def upload_answer(request,id):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_query.objects.get(query_id=id)
        return render(request,"uploadanswer.html",{'data':data})    

def update_answer(request,id):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_query.objects.get(query_id=id)
        if request.method=='POST':
            data.queryanswer=request.POST.get("queryanswer")
            data.status="ANSWERED"
            data.save()
            return redirect('/viewquery')    

def view_answer(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_query.objects.filter(user_id=request.session['user'])
        return render(request,"viewquery1.html",{'data':data})
        
def bookexpert(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_user.objects.get(user_id=request.session['user'])
        data1=tbl_expert.objects.filter(category=data.category).filter(status="VERIFIED")
        return render(request,"bookexpert.html",{'data1':data1})   


def bookexpert1(request,id):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.get(expert_id=id)
        data1=tbl_idgen.objects.get(id=1)
        s1 = data1.book_id
        s1 = int(s1+1)
        bid="BOOKING_00"+str(s1)
        request.session['s'] =s1
        data2=tbl_user.objects.get(user_id=request.session['user'])
        return render(request,"bookexpert1.html",{'data2':data2,'data':data,'book_id':bid}) 

def bookexpert2(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:  
        if request.method=="POST":
            data = tbl_bookexpert()
            data.booking_id= request.POST.get("bookid")
            data.user_id_id= request.POST.get("userid")
            data.expert_id_id= request.POST.get("expertid")

            timeIn24HourFormat = request.POST.get("booktime")
            dateTime = datetime.strptime(timeIn24HourFormat, '%H:%M')
            timeIn12HourFormat = dateTime.strftime('%I:%M %p').lstrip('0')
            data.bookingtime=timeIn12HourFormat

            data.bookingdate=request.POST.get("bookdate")
            data.status="PENDING"
            data.save()

            data1= tbl_idgen.objects.get(id=1)
            qid=request.session['s']
            data1.book_id = qid
            data1.save()

            return redirect('/bookexpert')


def book_expert(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_user.objects.get(user_id=request.session['user'])
        data1=tbl_expert.objects.filter(category=data.category).filter(status="VERIFIED")
        return render(request,"book_expert.html",{'data1':data1})   

def book_expert1(request,id):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.get(expert_id=id)
        data1=tbl_idgen.objects.get(id=1)
        s1 = data1.book_id
        s1 = int(s1+1)
        bid="BOOKING_00"+str(s1)
        request.session['s'] =s1
        data2=tbl_user.objects.get(user_id=request.session['user'])
        return render(request,"book_expert1.html",{'data2':data2,'data':data,'book_id':bid}) 

def book_expert2(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:  
        if request.method=="POST":
            data = tbl_bookexpert()
            data.booking_id= request.POST.get("bookid")
            data.user_id_id= request.POST.get("userid")
            data.expert_id_id= request.POST.get("expertid")

            timeIn24HourFormat = request.POST.get("booktime")
            dateTime = datetime.strptime(timeIn24HourFormat, '%H:%M')
            timeIn12HourFormat = dateTime.strftime('%I:%M %p').lstrip('0')
            data.bookingtime=timeIn12HourFormat
            
            data.bookingdate=request.POST.get("bookdate")
            data.status="PENDING"
            data.save()
            

            data1= tbl_idgen.objects.get(id=1)
            qid=request.session['s']
            data1.book_id = qid
            data1.save()

            return redirect('/book_expert')



def givereview(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_user.objects.get(user_id=request.session['user'])
        data1=tbl_expert.objects.filter(category=data.category).filter(status="VERIFIED")
        return render(request,"givereview.html",{'data1':data1})   

def addreview(request,id):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.get(expert_id=id)
        data1=tbl_idgen.objects.get(id=1)
        s1 = data1.review_id
        s1 = int(s1+1)
        rid="REVIEW_00"+str(s1)
        request.session['s'] =s1
        data2=tbl_user.objects.get(user_id=request.session['user'])
        return render(request,"addreview.html",{'data2':data2,'data':data,'review_id':rid}) 

def addreview1(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:  
        today = date.today()
        if request.method=="POST":
            data = tbl_review()
            data.review_id= request.POST.get("reviewid")
            data.user_id_id= request.POST.get("userid")
            data.expert_id_id= request.POST.get("expertid")
            data.review=request.POST.get("review")
            data.reviewdate= today
            data.save()

            data1= tbl_idgen.objects.get(id=1)
            qid=request.session['s']
            data1.review_id = qid
            data1.save()

            return redirect('/givereview')


def give_review(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_user.objects.get(user_id=request.session['user'])
        data1=tbl_expert.objects.filter(category=data.category).filter(status="VERIFIED")
        return render(request,"give_review.html",{'data1':data1})   

def add_review(request,id):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.get(expert_id=id)
        data1=tbl_idgen.objects.get(id=1)
        s1 = data1.review_id
        s1 = int(s1+1)
        rid="REVIEW_00"+str(s1)
        request.session['s'] =s1
        data2=tbl_user.objects.get(user_id=request.session['user'])
        return render(request,"add_review.html",{'data2':data2,'data':data,'review_id':rid}) 

def add_review1(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:  
        today = date.today()
        if request.method=="POST":
            data = tbl_review()
            data.review_id= request.POST.get("reviewid")
            data.user_id_id= request.POST.get("userid")
            data.expert_id_id= request.POST.get("expertid")
            data.review=request.POST.get("review")
            data.reviewdate= today
            data.save()

            data1= tbl_idgen.objects.get(id=1)
            qid=request.session['s']
            data1.review_id = qid
            data1.save()

            return redirect('/give_review')

def viewbooking(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.get(expert_id=request.session['expert'])
        data1=tbl_bookexpert.objects.filter(expert_id_id=data.expert_id).filter(status="PENDING")
        return render(request,"viewbooking.html",{'data':data1})


def view_booking(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_expert.objects.get(expert_id=request.session['expert'])
        data1=tbl_bookexpert.objects.filter(expert_id_id=data.expert_id).filter(status="PENDING")
        return render(request,"view_booking.html",{'data':data1})

def acceptbooking(request,id):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_bookexpert.objects.get(booking_id=id)
        data.status="ACCEPTED"
        data.save()

        return rendirect('/viewbooking')

def rejectbooking(request,id):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_bookexpert.objects.get(booking_id=id)
        data.status="REJECTED"
        data.save()
        return redirect('/viewbooking')

def accept_booking(request,id):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_bookexpert.objects.get(booking_id=id)
        data.status="ACCEPTED"
        data.save()

        return redirect('/view_booking')

def reject_booking(request,id):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_bookexpert.objects.get(booking_id=id)
        data.status="REJECTED"
        data.save()
        return redirect('/view_booking')

def addvideomental(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_idgen.objects.get(id=1)
        s1 = data.video_id
        s1 = int(s1+1)
        vid="VID_00"+str(s1)
        request.session['s'] =s1
        data1=tbl_expert.objects.get(expert_id=request.session['expert'])
        return render(request,"addvideo1.html",{'video_id':vid,'data':data1})

def addvideomental1(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        today = date.today()
        if request.method=="POST":
            data = tbl_video()
            data.video_id= request.POST.get("videoid")
            data.expert_id_id= request.POST.get("expertid")
            data1=tbl_expert.objects.get(expert_id=request.POST.get("expertid"))
            data.category=data1.category
            data.uploaded_date= today
            Photo = request.FILES['video']
            fs = FileSystemStorage()
            filename = fs.save(Photo.name, Photo)
            uploaded_file_url = fs.url(filename)
            data.video=uploaded_file_url
            data.save()

            data2= tbl_idgen.objects.get(id=1)
            vid=request.session['s']
            data2.video_id = vid
            data2.save()

            return render(request,"expmentalability.html")


def removevideomental(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_video.objects.filter(expert_id=request.session['expert'])
        return render(request,"viewvideo1.html",{'data':data})

def removevideomental1(request,id):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_video.objects.get(video_id=id)
        data.delete()
    return render(request,"expmentalability.html")

def addwebinar(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_idgen.objects.get(id=1)
        s1 = data.webinar_id
        s1 = int(s1+1)
        wid="WEB_00"+str(s1)
        request.session['s'] =s1
        data1=tbl_expert.objects.get(expert_id=request.session['expert'])
        return render(request,"addwebinar.html",{'webinar_id':wid,'data':data1})

def addwebinar1(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        if request.method=="POST":
            data = tbl_webinar()
            data.webinar_id= request.POST.get("webinarid")
            data.expert_id_id= request.POST.get("expertid")
            data.webinardate= request.POST.get("webinardate")
            data.Topic=request.POST.get("topic")
            data.status="PENDING"
            data.save()

            data2= tbl_idgen.objects.get(id=1)
            vid=request.session['s']
            data2.webinar_id = vid
            data2.save()

            return render(request,"expmentalability.html")


def removewebinar(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_webinar.objects.filter(expert_id=request.session['expert'])
        return render(request,"viewwebinar.html",{'data':data})

def removewebinar1(request,id):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_webinar.objects.get(webinar_id=id)
        data.delete()
    return render(request,"expmentalability.html")

def viewwebinar(request):
        data=tbl_webinar.objects.all()
        return render(request,"viewwebinar1.html",{'data':data})

def viewexpert(request):
        data=tbl_expert.objects.filter(status="VERIFIED")
        return render(request,"viewexpert3.html",{'data':data})

def viewreview1(request,id):
        data=tbl_review.objects.filter(expert_id_id=id)
        return render(request,"viewreview.html",{'data':data})

def viewvideos(request):
        data=tbl_video.objects.filter(category="Sex_Education")
        return render(request,"viewvideo2.html",{'data':data})

def viewarticle(request):
        data=tbl_article.objects.all()
        return render(request,"viewarticle1.html",{'data':data})

def view_videos(request):
        data=tbl_video.objects.filter(category="Mental_Ability")
        return render(request,"viewvideo3.html",{'data':data})


def attendtest(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:       
        data=tbl_question.objects.filter(status="PENDING")
        return render(request,"viewquestion1.html",{'data':data})

def addresult(request,id):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        if 't' not in request.session:
            data2=tbl_idgen.objects.get(id=1)
            s1 = data2.test_id
            s1 = int(s1+1)
            tid="TEST_00"+str(s1)
            request.session['r'] =s1
            request.session['t'] =tid

            today = date.today()
            data = tbl_result()
            data.test_no=request.session['t']
            data.user_id_id=request.session['user']
            data.score=1
            data.date=today
            data.save()

            data1=tbl_question.objects.get(question_no=id)
            data1.status="ATTENDED"
            data1 .save()
          
        else:
            data=tbl_result.objects.get(test_no=request.session['t'])  
            s1=data.score
            s1=int(s1)+1
            data.score=s1
            data.save()

            data1=tbl_question.objects.get(question_no=id)
            data1.status="ATTENDED"
            data1 .save()

    return redirect('/attendtest')

def noresult(request,id):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:       
        data=tbl_question.objects.get(question_no=id)
        data.status="ATTENDED"
        data.save()

    return redirect('/attendtest')

def finishtest(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        data1=tbl_result.objects.get(test_no=request.session['t'])
        s1=data1.score
        s1=int(s1)
        if s1>10:
            data1.interference="You are stressed"
            data1.save()
        elif s1>8 and s1<=10:
            data1.interference="Stress is likely"
            data1.save()
        elif s1>5 and s1<=8:
            data1.interference="Stress is possible"
            data1.save()
        else:
            data1.interference="Stress Unlikely"
            data1.save()

        data2= tbl_idgen.objects.get(id=1)
        data2.test_id=request.session['r']
        data2.save()

        data=tbl_question.objects.all()
        for x in data:
            x.status="PENDING"
            x.save()
        
        del request.session['t']
    return redirect('/user')

def view_result(request):
    if 'expert' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_result.objects.all()
        return render(request,"viewtestresult.html",{'data':data})

def addevent(request):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_idgen.objects.get(id=1)
        s1 = data.event_id
        s1 = int(s1+1)
        eid="EVENT_00"+str(s1)
        request.session['s'] =s1
        return render(request,"addevent.html",{'data':eid})
 
def add_event(request):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        if request.method=="POST":
            data = tbl_event()
            data.event_id= request.POST.get("eventid")
            data.event= request.POST.get("event")
            data.event_date= request.POST.get("eventdate")
            data.status= "PENDING"
            Photo = request.FILES['image']
            fs = FileSystemStorage()
            filename = fs.save(Photo.name, Photo)
            uploaded_file_url = fs.url(filename)
            data.photo=uploaded_file_url
            data.save()

            data1= tbl_idgen.objects.get(id=1)
            eid=request.session['s']
            data1.event_id = eid
            data1.save()

        return redirect('/addevent')

def removeevent(request):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_event.objects.all()
        return render(request,"viewevent.html",{'data1':data})


def remove_event(request,id):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_event.objects.get(event_id=id)
        data.delete()
        return redirect('/removeevent')

def viewevent(request):
    data=tbl_event.objects.all()
    return render(request,"viewevent1.html",{'data':data})

def view_testresult(request):
    if 'adm' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_result.objects.all()
        return render(request,"viewtestresult1.html",{'data':data})

def view_testresult1(request):
    if 'user' not in request.session:
        return render(request,"login.html")
    else:
        data=tbl_result.objects.filter(user_id_id=request.session['user'])
        return render(request,"viewtestresult2.html",{'data':data})

def view_review(request):
        data=tbl_review.objects.filter(user_id=request.session['user'])
        return render(request,"viewreview1.html",{'data':data})

def viewreview(request):
        data=tbl_review.objects.filter(user_id=request.session['user'])
        return render(request,"viewreview2.html",{'data':data})




           


# Create your views here.
