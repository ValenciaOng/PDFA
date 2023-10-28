# import csv file
assg_data = read.csv("C:\\Users\\brand\\OneDrive\\Desktop\\PFDA\\PFDA-Assignment\\student_prediction.csv", header = TRUE)
#assg_data
options(max.print = 999999)

# cleaning 
# check the current names
names(assg_data)

# change column names
names(assg_data) = c("StuID","StuAge","StuGen","GradHS_Type","Scholarship_Type","Add_Work",
                     "Art_Sport","StuPartner","StuSal","StuTransport","StuAccomodation",
                     "StuMom_Edu","StuDad_Edu","NoSibilings","Parents_Status",
                     "StuMom_Job","StuDad_Job","W_StudyHrs","ReadFreq_XSci","ReadFreq_Sci",
                     "Att_Dept","Impact_Suc","Att_Class","Prep_Ex1","Prep_Ex2","TakingNotes",
                     "ListenClass","Discuss_Imp","Flip_Class","CGPA_LSem","Exp_CGPA","CourseID","Grade")
#assg_data

# delete rows (remove null rows - na.omit())
assg_data <- na.omit(assg_data)
#assg_data

# exclude duplicates
assg_data <- unique(assg_data)  #distinct()
assg_data

##Attributes
#---------------------------------------------------------------------------------------------------
#Student Age
assg_data$StuAge<- factor(assg_data$StuAge,levels=c(1,2,3), labels=c("18-21","22-25","Above 26"))
#Student Gender
assg_data$StuGen<- factor(assg_data$StuGen,levels=c(1,2), labels=c("Female","Male"))
#Student Graduated Highschool Type
assg_data$GradHS_Type<- factor(assg_data$GradHS_Type,levels=c(1,2,3), labels=c("Private","State","Other"))
#Scholarship Type
assg_data$Scholarship_Type<- factor(assg_data$Scholarship_Type,levels=c(1,2,3,4,5), labels=c("None","25%","50%","75%","Full"))
#Additional work
assg_data$Add_Work<- factor(assg_data$Add_Work,levels=c(1,2), labels=c("Yes","No"))
#Regular artistic or sports activity
assg_data$Art_Sport<- factor(assg_data$Art_Sport,levels=c(1,2), labels=c("Yes","No"))
#Do you have a partner
assg_data$StuPartner<- factor(assg_data$StuPartner,levels=c(1,2), labels=c("Yes","No"))
#Total salary if available 
assg_data$StuSal<- factor(assg_data$StuSal,levels=c(1,2,3,4,5), labels=c("USD 135-200", "USD 201-270", "USD 271-340","USD 341-410","Above 410"))
#Transportation to the university
assg_data$StuTransport<- factor(assg_data$StuTransport,levels=c(1,2,3,4), labels=c("Bus", "Private car/taxi", "Bicycle", "Other"))
#Accommodation type in Cyprus
assg_data$StuAccomodation<- factor(assg_data$StuAccomodation,levels=c(1,2,3,4), labels=c("Rental", "Dormitory", "With family", "Other"))
#Mother's education
assg_data$StuMom_Edu<- factor(assg_data$StuMom_Edu,levels=c(1,2,3,4,5,6), labels=c("Primary School", "Secondary School", "High School", "University","MSc.","Ph.D."))
#Father's education
assg_data$StuDad_Edu<- factor(assg_data$StuDad_Edu,levels=c(1,2,3,4,5,6), labels=c("Primary School", "Secondary School", "High School", "University","MSc.","Ph.D."))
# Number of sisters/brothers (if available)
assg_data$NoSibilings<- factor(assg_data$NoSibilings,levels=c(1,2,3,4,5), labels=c("1", "2", "3", "4", "5 or above"))
#Parental status
assg_data$Parents_Status<- factor(assg_data$Parents_Status,levels=c(1,2,3), labels=c("Married", "Divorced", "Died - One or Both"))
#Mother's occupation
assg_data$StuMom_Job<- factor(assg_data$StuMom_Job,levels=c(1,2,3,4,5,6), labels=c("Retired","Housewife","Government Officer","Private Sector Employee", "Self-Employment","Other"))
#Father's occupation
assg_data$StuDad_Job<- factor(assg_data$StuDad_Job,levels=c(1,2,3,4,5), labels=c("Retired","Government Officer","Private Sector Employee", "Self-Employment","Other"))
#Weekly study hours
assg_data$W_StudyHrs<- factor(assg_data$W_StudyHrs,levels=c(1,2,3,4,5), labels=c("None","<5 Hours","6-10 Hours","11-20 Hours","More than 20 Hours"))
#Reading frequency (non-scientific books/journals)
assg_data$ReadFreq_XSci<- factor(assg_data$ReadFreq_XSci,levels=c(1,2,3), labels=c("None","Sometimes","Often"))
#Reading frequency (scientific books/journals)
assg_data$ReadFreq_Sci<- factor(assg_data$ReadFreq_Sci,levels=c(1,2,3), labels=c("None","Sometimes","Often"))
#Attendance to the seminars/conferences related to the department
assg_data$Att_Dept<- factor(assg_data$Att_Dept,levels=c(1,2), labels=c("Yes","No"))
#Impact of your projects/activities on your success
assg_data$Impact_Suc<- factor(assg_data$Impact_Suc,levels=c(1,2,3), labels=c("Positive","Negative","Neutral"))
# Attendance to classes
assg_data$Att_Class<- factor(assg_data$Att_Class,levels=c(1,2,3), labels=c("Always","Sometimes","Never"))
#Preparation to midterm exams
assg_data$Prep_Ex1<- factor(assg_data$Prep_Ex1,levels=c(1,2,3), labels=c("Alone","With Friends","Not Applicable"))
#Preparation to midterm exams
assg_data$Prep_Ex2<- factor(assg_data$Prep_Ex2,levels=c(1,2,3), labels=c("Closest date to the exam","Regularly during the semester","Never"))
#Taking notes in classes
assg_data$TakingNotes<- factor(assg_data$TakingNotes,levels=c(1,2,3), labels=c("Never","Sometimes","Always"))
#Listening in classes
assg_data$ListenClass<- factor(assg_data$ListenClass,levels=c(1,2,3), labels=c("Never","Sometimes","Always"))
#Discussion improves my interest and success in the course
assg_data$Discuss_Imp<- factor(assg_data$Discuss_Imp,levels=c(1,2,3), labels=c("Never","Sometimes","Always"))
#Flip-classroom
assg_data$Flip_Class<- factor(assg_data$Flip_Class,levels=c(1,2,3), labels=c("Not Useful","Useful","Not Applicable"))
#Cumulative grade point average in the last semester (/4.00)
assg_data$CGPA_LSem<- factor(assg_data$CGPA_LSem,levels=c(1,2,3,4,5), labels=c("<2.00","2.00-2.49","2.50-2.99","3.00-3.49","Above 3.49"))
#Expected Cumulative grade point average in the graduation (/4.00)
assg_data$Exp_CGPA<- factor(assg_data$Exp_CGPA,levels=c(1,2,3,4,5), labels=c("<2.00","2.00-2.49","2.50-2.99","3.00-3.49","Above 3.49"))
#OUTPUT Grade 
assg_data$Grade<- factor(assg_data$Grade,levels=c(0,1,2,3,4,5,6,7), labels=c("Fail","DD","DC","CC","CB","BB","BA","AA"))


View(assg_data[,c("StuID","Att_Class","StuPartner","StuTransport","Add_Work","Art_Sport")])
View(assg_data[,c("StuID","Att_Class","StuPartner")])
View(assg_data[,c("StuID","Att_Class","StuTransport")])
View(assg_data[,c("StuID","Att_Class","Add_Work")])
View(assg_data[,c("StuID","Att_Class","Art_Sport")])

View(head(assg_data[,c("StuID","Att_Class","StuPartner","StuTransport","Add_Work","Art_Sport")],10))
View(tail(assg_data[,c("StuID","Att_Class","StuPartner","StuTransport","Add_Work","Art_Sport")],10))

View(head(assg_data[,c("StuID","Att_Class","StuPartner")],10))
View(tail(assg_data[,c("StuID","Att_Class","StuPartner")],10))

View(head(assg_data[,c("StuID","Att_Class","StuTransport")],10))
View(tail(assg_data[,c("StuID","Att_Class","StuTransport")],10))

View(head(assg_data[,c("StuID","Att_Class","Add_Work")],10))
View(tail(assg_data[,c("StuID","Att_Class","Add_Work")],10))

View(head(assg_data[,c("StuID","Att_Class","Art_Sport")],10))
View(tail(assg_data[,c("StuID","Att_Class","Art_Sport")],10))

summary(assg_data[,c("StuID","Att_Class","StuPartner","StuTransport","Add_Work","Art_Sport")])

