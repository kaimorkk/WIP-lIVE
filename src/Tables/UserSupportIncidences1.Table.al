Table 52193733 "User Support Incidences1"
{
    DrillDownPageID = "User Incidences List";
    LookupPageID = "User Incidences List";

    fields
    {
        field(1;"Incident Reference";Code[60])
        {

            trigger OnValidate()
            begin
                if "Incident Reference" <> xRec."Incident Reference" then begin
                  SalesSetup.Get;
                  NoSeriesMgt.TestManual(SalesSetup."User Support Inc Nos");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;"Incident Description";Text[250])
        {
        }
        field(3;"Incident Date";Date)
        {
        }
        field(4;"Incident Status";Option)
        {
            OptionMembers = ,Unresolved,Resolved;
        }
        field(5;"No. Series";Code[60])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(6;"Action taken";Text[250])
        {
        }
        field(7;"Action Date";Date)
        {
        }
        field(8;User;Code[50])
        {
            TableRelation = User;

            trigger OnValidate()
            begin
                
                /*Users.GET("Employee No");
                "Employee No":=Users."Employee No.";
                //"User email Address":=Users."User Email";
                "User email Address":=Users."E-Mail";
                "Employee Name":=Users."Approver ID";
                //"Employee Name":=Users.Alert;
                MODIFY; */
                
                
                
                
                Modify;

            end;
        }
        field(9;"System Support Email Address";Text[80])
        {
        }
        field(10;"User email Address";Text[80])
        {
        }
        field(11;Type;Option)
        {
            OptionMembers = ICT,ADM,REGISTRY,"KEYS";
        }
        field(12;"File No";Code[30])
        {
            TableRelation = "File Details1";
        }
        field(13;"Incident Time";Time)
        {
        }
        field(14;"Action Time";Time)
        {
        }
        field(15;"Employee No";Code[50])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                /* User:=USERID;
                 Users.GET("Employee No");
                    */
                   //IF Users.GET(Users."Employee No.") THEN
                   //"User email Address":=Users."E-Mail";
                
                
                
                
                //Users.GET("Employee No");
                //Rec.TESTFIELD("User email Address");
                 //Users."E-Mail":= '';
                // Users."E-Mail":="User email Address";
                // "User email Address":= Users."E-Mail";
                
                //MODIFY ;

            end;
        }
        field(16;"Employee Name";Text[100])
        {
        }
        field(17;Sent;Boolean)
        {
        }
        field(18;"User Informed?";Boolean)
        {
        }
        field(19;"Work place Controller";Code[50])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                     // "Employee No":=Users."Employee No.";
                    // "Work place Controller"
                      emp.Get("Work place Controller");
                       "Work place Controller Name":=emp."First Name"+' '+emp."Last Name";
            end;
        }
        field(20;"Work place Controller Name";Text[100])
        {
        }
        field(21;"Incidence Location";Code[50])
        {
        }
        field(22;"Incidence Location Name";Text[100])
        {
        }
        field(23;"Incidence Outcome";Option)
        {
            OptionCaption = '  ,Dangerous,Serious bodily injury,Work caused illness,Serious electrical incident,Dangerous electrical event,MajorAccident under the OSHA Act';
            OptionMembers = "  ",Dangerous,"Serious bodily injury","Work caused illness","Serious electrical incident","Dangerous electrical event","MajorAccident under the OSHA Act";
        }
        field(24;"Incident Outcome";Option)
        {
            OptionCaption = '  ,Yes,No';
            OptionMembers = "  ",Yes,No;
        }
        field(25;"Remarks HR";Text[250])
        {
        }
        field(26;Category;Option)
        {
            OptionCaption = ' ,Incident,Maintenance,Grievance';
            OptionMembers = " ",Incident,Maintenance,Grievance;
        }
    }

    keys
    {
        key(Key1;"Incident Reference","Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Incident Reference"= '' then begin
        
        if Category=Category::Incident then begin
          HRSetup.Get;
          HRSetup.TestField(HRSetup."User Incident");
          NoSeriesMgt.InitSeries(HRSetup."User Incident",xRec."No. Series",0D,"Incident Reference","No. Series");
        end;
        
        if Category=Category::Maintenance then begin
          HRSetup.Get;
          HRSetup.TestField(HRSetup."Maintenance Req Nos");
          NoSeriesMgt.InitSeries(HRSetup."Maintenance Req Nos",xRec."No. Series",0D,"Incident Reference","No. Series");
          "Incident Time":=Time;
        end;
        /*
        IF Category=Category::Grievance THEN BEGIN
          HRSetup.GET;
          HRSetup.TESTFIELD(HRSetup."Grievance Nos");
          NoSeriesMgt.InitSeries(HRSetup."Grievance Nos",xRec."No. Series",0D,"Incident Reference","No. Series");
          "Incident Date":=TODAY;
        END;
        */
        
        
        end;
        CompanyInformation.Get;
        "System Support Email Address":=CompanyInformation."HR Support Email";
        
        
        //User:=USERID;
        /*
        IF Users.GET("Employee No")THEN BEGIN
        "Employee No":=Users."Employee No.";
        "User email Address":=Users."E-Mail";
        User:=Users."Approver ID";
        //"Employee Name":=Users.Alert;
        END;
         */
        
        
         User:=UserId;
          if Users.Get(UserId) then
          begin
            "Employee No":=Users."Employee No.";
            if emp.Get(Users."Employee No.") then
             "Employee Name":=emp."First Name"+' '+emp."Middle Name"+' '+emp."Last Name";
            "User email Address":=Users."E-Mail";
          end;

    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CompanyInformation: Record "Company Information";
        Users: Record "User Setup";
        emp: Record Employee;
        HRSetup: Record "Human Resources Setup";
}

