"""mentalhealth URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf import settings
from mentalapp import views
from django.conf.urls.static import static

urlpatterns = [
    path('index/',views.index),
    path('form/',views.form),
   
    path('menubar/',views.menubar),
    path('adminmenu/',views.adminmenu),
    path('publicmember/',views.publicmember),
    path('semenu/',views.semenu),
    path('mamenu/',views.mamenu),
    path('esemenu/',views.esemenu),
    path('emamenu/',views.emamenu),  
    path('table/',views.table),

    path('login/',views.login),
    path('login1/',views.login1),
    path('adminlogout/',views.adminlogout),
    path('expertlogout/',views.expertlogout),
    path('userlogout/',views.userlogout),

    path('expertreg/',views.expertreg),
    path('expertreg1/',views.expertreg1),
    path('userreg/',views.userreg),
    path('userreg1/',views.userreg1),     
    path('viewexpert/',views.viewexpert),
    path('viewwebinar/',views.viewwebinar),
    path('viewreview1/<str:id>',views.viewreview1),
    path('viewevent/',views.viewevent),

    path('admin/',views.admin),
    path('addexpert/',views.addexpert),
    path('addexpert1/',views.addexpert1),
    path('removeexpert/',views.removeexpert),
    path('delexpert/<str:id>',views.delexpert),
    path('updateexpert/',views.updateexpert),
    path('updexpert/<str:id>',views.updexpert),
    path('updateexpert1/<str:id>',views.updateexpert1),
    path('verifyexpert/',views.verifyexpert),
    path('acceptexpert/<str:id>',views.acceptexpert),
    path('rejectexpert/<str:id>',views.rejectexpert),
    path('addquestion/',views.addquestion),
    path('add_question/',views.add_question),
    path('removequestion/',views.removequestion),
    path('remove_question/<str:id>',views.remove_question),
    path('addevent/',views.addevent),
    path('add_event/',views.add_event),
    path('removeevent/',views.removeevent),
    path('remove_event/<str:id>',views.remove_event),
    path('view_testresult/',views.view_testresult),
    
    path('expert/',views.expert),
    path('add_article/',views.add_article),
    path('addarticle/',views.addarticle),
    path('removearticle/',views.removearticle),
    path('delarticle/<str:id>',views.remove_article),
    path('add_video/',views.add_video),
    path('addvideo/',views.addvideo),
    path('remove_video/',views.remove_video),
    path('removevideo/<str:id>',views.removevideo),

    path('addvideomental/',views.addvideomental),
    path('addvideomental1/',views.addvideomental1),
    path('removevideomental/',views.removevideomental),
    path('removevideomental1/<str:id>',views.removevideomental1),
    path('view_result/',views.view_result),

    path('user/',views.user),
    path('generatequery/',views.generatequery),
    path('addquery/',views.addquery),
    path('viewquery/',views.viewquery),
    path('upload_answer/<str:id>',views.upload_answer),
    path('update_answer/<str:id>',views.update_answer),
    path('view_answer/',views.view_answer),
    path('bookexpert/',views.bookexpert),
    path('bookexpert1/<str:id>',views.bookexpert1),
    path('bookexpert2/',views.bookexpert2),
    path('book_expert/',views.book_expert),
    path('book_expert1/<str:id>',views.book_expert1),
    path('book_expert2/',views.book_expert2),
    path('viewbooking/',views.viewbooking),
    path('view_booking/',views.view_booking),
    path('acceptbooking/<str:id>',views.acceptbooking),
    path('rejectbooking/<str:id>',views.rejectbooking),
    path('accept_booking/<str:id>',views.accept_booking),
    path('reject_booking/<str:id>',views.reject_booking),

    path('givereview/',views.givereview),
    path('give_review/',views.give_review),
    path('addreview/<str:id>',views.addreview),
    path('addreview1/',views.addreview1),
    path('add_review/<str:id>',views.add_review),
    path('add_review1/',views.add_review1),
    path('viewreview/',views.viewreview),
    path('view_review/',views.view_review),

    path('addwebinar/',views.addwebinar),
    path('addwebinar1/',views.addwebinar1),
    path('removewebinar/',views.removewebinar),
    path('removewebinar1/<str:id>',views.removewebinar1),

    path('viewvideos/',views.viewvideos),
    path('viewarticle/',views.viewarticle),
    path('view_videos/',views.view_videos),

    path('attendtest/',views.attendtest),
    path('addresult/<str:id>',views.addresult),
    path('noresult/<str:id>',views.noresult),
    path('finishtest/',views.finishtest),
    path('view_testresult1/',views.view_testresult1),
   






   
 
    path('userse/',views.userse),
    path('userma/',views.userma),    
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)