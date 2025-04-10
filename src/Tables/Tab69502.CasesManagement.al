
table 69502 "Cases Management"
{
    DataClassification = CustomerContent;
    //  LookupPageID = UnknownPage53954;

    fields
    {
        field(1; "Enquiry Number"; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Date of Complaint"; DateTime)
        {
            Caption = 'Date of Interaction';
        }
        field(4; "Interaction Type"; Enum "Interaction Types")
        {
            // Caption = 'Nature of Enquiry';
            // NotBlank = true;
            // OptionCaption = ' ,Products,Graduate school,Clinic,internal,External';
            // OptionMembers = " ",Products,"Graduate school",Clinic,internal,External;
        }
        field(5; "Recommended Action"; Code[50])
        {
        }
        field(6; "Case Description"; Blob)
        {
            Caption = 'Enquiry Description';

        }
        field(7; Accuser; Code[50])
        {
        }
        field(8; "Resource#1"; Code[50])
        {
            TableRelation = User."User Name";

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //  UserMgt.LookupUserID("Resource#1");
            end;

            trigger OnValidate()
            var
                UserMgt: Codeunit "User Management";
            begin
                if casem.Get("Resource#1") then begin
                    "Resource Assigned" := casem."Resource#1";
                    Message("Resource Assigned");
                end;
                // UserMgt.ValidateUserID("Resource#1");
            end;
        }
        field(9; "Resource #2"; Code[50])
        {
            TableRelation = User."User Name";

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //  UserMgt.LookupUserID("Resource #2");
            end;

            trigger OnValidate()
            var
                UserMgt: Codeunit "User Management";
            begin
                if casen.Get("Resource #2") then begin
                    "Resource Assigned" := "Resource #2";
                    Message("Resource Assigned");
                end;
                //   UserMgt.ValidateUserID("Resource #2");
            end;
        }
        field(10; "Action Taken"; Code[100])
        {
        }
        field(11; "Date To Settle Case"; Date)
        {
            Caption = 'Due Date';
        }
        field(12; "Document Link"; Text[200])
        {
        }
        field(13; "Solution Remarks"; Text[250])
        {
        }
        field(14; Comments; Text[250])
        {
        }
        field(15; "Case Solved"; Boolean)
        {
            Caption = 'Resolved';
        }
        field(16; "Body Handling The Complaint"; Code[20])
        {
            Caption = 'Responsibility Center';
        }
        field(17; Recomendations; Code[20])
        {
        }
        field(18; Implications; Integer)
        {
        }
        field(19; "Support Documents"; Option)
        {
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(20; "Policy Guidlines In Effect"; Code[20])
        {
        }
        field(21; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Assigned,Resolved,Closed';
            OptionMembers = Open,Assigned,Resolved,Closed;
        }
        field(22; "Mode of Lodging the Complaint"; Text[30])
        {
        }
        field(23; "No. Series"; Code[20])
        {
        }
        field(24; "Resource Assigned"; Code[30])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                // UserMgt.LookupUserID("Resource Assigned");
            end;

            trigger OnValidate()
            var
                UserMgt: Codeunit "User Management";
            begin
                //   UserMgt.ValidateUserID("Resource Assigned");
            end;
        }
        field(25; Selected; Boolean)
        {
        }
        field(26; "Closed By"; Date)
        {
        }
        field(28; "Caller Reffered To"; Code[50])
        {
            TableRelation = User."User Name";

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //    UserMgt.LookupUserID("Caller Reffered To");
            end;

            trigger OnValidate()
            var
                UserMgt: Codeunit "User Management";
            begin
                // UserMgt.ValidateUserID("Caller Reffered To");

                ObjUsers.Reset;
                ObjUsers.SetRange(ObjUsers."User Name", UserId);
                if ObjUsers.FindSet then begin
                    "Escalated User Email" := ObjUsers."Contact Email";
                end;
            end;
        }
        field(29; "Received From"; Text[100])
        {
        }
        field(33; "Date Sent"; Date)
        {
        }
        field(34; "Time Sent"; Time)
        {
        }
        field(35; "Sent By"; Code[50])
        {
            Description = '//surestep crm';
        }
        field(36; SLA; Option)
        {
            OptionCaption = ' ,24HRS,48HRS,72HRS';
            OptionMembers = " ","24HRS","48HRS","72HRS";

            trigger OnValidate()
            begin
                if SLA = Sla::"24HRS" then
                    CPeriod := 1;
                if SLA = Sla::"48HRS" then
                    CPeriod := 2;
                if SLA = Sla::"72HRS" then
                    CPeriod := 3;
                //*** validate
                currYear := Date2dmy(Today, 3);
                StartDate := 0D;
                EndDate := 0D;
                Month := Date2dmy("Case Received  Date", 2);
                DAY := Date2dmy("Case Received  Date", 1);


                StartDate := Dmy2date(1, Month, currYear); // StartDate will be the date of the first day of the month

                if Month = 12 then begin
                    Month := 0;
                    currYear := currYear + 1;

                end;
                EndDate := Dmy2date(1, Month, currYear) - 1;
                "Date To Settle Case" := CalcDate(Format(CPeriod) + 'D', "Case Received  Date");
            end;
        }
        field(37; "Case Received  Date"; Date)
        {
            Editable = false;
        }
        field(38; "Is Customer"; Boolean)
        {
            ToolTip = 'Select if the entity is a customer who has engaged our services before.';
        }
        field(39; "Contact No"; Code[20])
        {
            Caption = 'Customer/Contact No';
            TableRelation = if ("Is Customer" = const(false)) Contact."No." else
            Customer."No.";
            trigger OnValidate()
            var
                Cust: Record Customer;
                Cont: Record Contact;
            begin
                if "Is Customer" then begin
                    Cust.Get("Contact No");
                    "Received From" := Cust.Name;
                    Telephone := Cust."Phone No.";
                    Rec.Email := Cust."E-Mail";
                end else begin
                    Cont.Get("Contact No");
                    "Received From" := Cont.Name;
                    Telephone := Cont."Phone No.";
                    Rec.Email := Cont."E-Mail";
                end;
            end;
        }

        field(3963; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center";
        }
        field(3964; "Member No."; Code[20])
        {
            Caption = 'Customer No';
        }
        field(3965; "FOSA Account."; Code[50])
        {
            TableRelation = Vendor."No.";
        }
        field(3966; "Account Name."; Text[50])
        {
        }
        field(3967; "Loan No"; Code[20])
        {
            Caption = 'Project';
            TableRelation = Job;
        }
        field(3968; "Receive User"; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(3969; "Receive date"; Date)
        {
        }
        field(3970; "Receive Time"; Time)
        {
        }
        field(3971; "Resolved User"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(3972; "Resolved Date"; Date)
        {
        }
        field(3973; "Resolved Time"; Time)
        {
        }
        field(68030; "Company No"; Code[50])
        {
            Description = '//surestep crm';
        }
        field(68031; "Company Name"; Text[100])
        {
            Description = '//surestep crm';
        }
        field(68043; "Company Address"; Code[50])
        {
        }
        field(68044; "Company postal code"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(68045; Telephone; Code[20])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(68046; Email; Text[100])
        {
            ExtendedDatatype = EMail;
        }
        field(68047; "Company website"; Text[30])
        {
            ExtendedDatatype = URL;
        }
        field(68121; "Employment Info"; Option)
        {
            OptionCaption = ' ,Employed,Self-Employed,Contracting,Others';
            OptionMembers = " ",Employed,"Self-Employed",Contracting,Others;
        }
        field(68123; "Others Details"; Text[30])
        {
        }
        field(69167; "Employment Terms"; Option)
        {
            OptionCaption = ' ,Permanent,Casual';
            OptionMembers = " ",Permanent,Casual;
        }
        field(69168; "Employer Type"; Option)
        {
            OptionCaption = ' ,Employed,Business';
            OptionMembers = " ",Employed,Business;
        }
        field(69174; "Employer Address"; Code[20])
        {
        }
        field(69175; "Date of Employment"; Date)
        {
        }
        field(69176; "Position Held"; Code[20])
        {
        }
        field(69177; "Expected Monthly Income"; Decimal)
        {
        }
        field(69178; "Nature Of Business"; Option)
        {
            OptionCaption = 'Sole Proprietorship, Partnership';
            OptionMembers = "Sole Proprietorship"," Partnership";
        }
        field(69179; Industry; Code[20])
        {
        }
        field(69180; "Business Name"; Code[20])
        {
        }
        field(69181; "Physical Business Location"; Code[20])
        {
        }
        field(69182; "Year of Commence"; Date)
        {
        }
        field(69183; "Job Task No"; Code[20])
        {
            TableRelation = "Job Task"."Job Task No.";

            trigger OnValidate()
            begin
                /*IF ObjEmployers.GET("Employer Code") THEN BEGIN
                  "Employer Name":=ObjEmployers.Description;
                  END;*/

            end;
        }
        field(69184; "Employer Name"; Code[50])
        {
        }
        field(69185; "Terms of Employment"; Option)
        {
            OptionMembers = " ",Permanent,Contract,Casual;
        }
        field(69186; Occupation; Text[50])
        {
        }
        field(69187; Department; Code[20])
        {
        }
        field(69188; "Referee Member No"; Code[20])
        {
            Caption = 'Referee Customer No';
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                if Cust.Get("Referee Member No") then begin
                    "Referee Name" := Cust.Name;
                    "Referee Mobile Phone No" := Cust."Phone No.";
                    // "Referee ID No" := Cust."ID. No.";
                end;
            end;
        }
        field(69189; "Referee Name"; Code[40])
        {
            Editable = false;
        }
        field(69190; "Referee ID No"; Code[20])
        {
            Editable = false;
        }
        field(69191; "Referee Mobile Phone No"; Code[20])
        {
            Editable = false;
        }
        field(69192; "Lead Status"; Option)
        {
            OptionCaption = 'Open,Converted to Opportunity,Closed';
            OptionMembers = Open,"Converted to Opportunity",Closed;
        }
        field(69193; "Captured By"; Code[20])
        {
        }
        field(69194; "Captured On"; Date)
        {
        }
        field(69195; "Lead Region"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(69196; "Physical Meeting Location"; Text[40])
        {
        }
        field(69198; "Date of Escalation"; Date)
        {
        }
        field(69199; "Time of Escalation"; Time)
        {
        }
        field(69200; "Date Resolved"; DateTime)
        {
        }
        field(69201; "Time Resolved"; Time)
        {
        }
        field(69202; "Member No"; Code[20])
        {
            Caption = 'Customer No';
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                /*
                IF "Calling As"="Calling As"::"As Member" THEN BEGIN
                  Cust.RESET;
                  Cust.SETRANGE(Cust."No.","Member No");
                    IF Cust.FIND('-') THEN BEGIN
                      Cust.CALCFIELDS(Cust."Outstanding Balance",Cust."Current Shares",Cust."Insurance Fund",Cust."Un-allocated Funds",
                      Cust."Shares Retained");
                      "Member Name":=Cust.Name;
                      "Payroll No":=Cust."Personal No";
                      "Current Deposits":= Cust."Current Shares";
                      "ID No":= Cust."ID No.";
                      "Phone No":=Cust."Mobile Phone No";
                      "Passport No":= Cust."Passport No.";
                      "Fosa account":=Cust."FOSA Account";
                      Email:=Cust."E-Mail";
                      Gender:=Cust.Gender;
                      Status:=Cust.Status;
                      Address:=Cust.Address;
                      City:=Cust.City;
                      "Company No":=Cust."Employer Code";
                      "Company Name":=Cust."Employer Name";
                      "Share Capital":=Cust."Shares Retained";
                       Source:=Cust."Customer Posting Group";
                      "Employment Info":=Cust."Employment Info";
                      "Employer Code":=Cust."Employer Code";
                      "Employer Name":=Cust."Employer Name";
                      "Nature Of Business":=Cust."Nature Of Business";
                      "Business Name":=Cust."Business Name";
                      "Physical Business Location":=Cust."Physical Business Location";
                      "Terms of Employment":=Cust."Terms Of Employment";
                      "Referee Member No":=Cust."Referee Member No";
                      "Referee Name":=Cust."Referee Name";
                      "Referee Mobile Phone No":=Cust."Referee Mobile Phone No";
                      "Referee ID No":=Cust."Referee ID No";
                      END;
                        END ELSE
                          IF "Calling As"="Calling As"::"As Member" THEN BEGIN
                          "Member Name":=PRD.Name;
                          "Phone No":=PRD."Phone No.";
                END
                */

            end;
        }
        field(69203; "Member Name"; Code[60])
        {
        }
        field(69204; "Payroll No"; Code[20])
        {
        }
        field(69205; "Loan Balance"; Decimal)
        {
        }
        field(69206; "Current Deposits"; Decimal)
        {
        }
        field(69207; "Holiday Savings"; Decimal)
        {
        }
        field(69208; Description; Text[250])
        {
        }
        field(69209; "Share Capital"; Decimal)
        {
        }
        field(69210; "ID No"; Code[20])
        {
        }
        field(69211; Gender; Option)
        {
            Description = 'Male,Female';
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
        field(69212; "Escalated User Email"; Text[30])
        {
        }
        field(69213; Priority; Option)
        {
            OptionCaption = ' ,High,Normal,Low';
            OptionMembers = " ",High,Normal,Low;
        }
        field(69214; "Follow up Action"; Text[250])
        {
        }
        field(69215; "Complaint No"; Code[20])
        {
        }
        field(69216; "Customer Type"; Option)
        {
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(69217; "Customer Group Code"; Code[20])
        {
            TableRelation = "Customer Group &  Mode".Code where("Customer Group" = filter(true));

            trigger OnValidate()
            begin
                if "Customer Mode".Get("Customer Group Code") then begin
                    "Customer Group" := "Customer Mode".Description;
                end;
            end;
        }
        field(69218; "Receiving Officer"; Code[50])
        {
            TableRelation = "User Setup"."User ID" /*where(CIDO = filter(true))*/;
        }
        field(69219; "Mode of Lodging Complaints Cod"; Code[20])
        {
            Caption = 'Mode of Lodging Complaints Code';
            TableRelation = "Customer Group &  Mode".Code where("Customer Group" = filter(false));

            trigger OnValidate()
            begin
                if "Customer Mode".Get("Mode of Lodging Complaints Cod") then begin
                    "Mode of Lodging Complaints" := "Customer Mode".Description;
                end;
            end;
        }
        field(69220; "Customer Group"; Text[250])
        {
            Editable = false;
        }
        field(69221; "Mode of Lodging Complaints"; Text[250])
        {
            Editable = false;
        }
        field(69222; "Assigned Officer Email"; Text[100])
        {
        }
        field(69223; "Assigned Officer Name"; Text[250])
        {
        }
        field(69224; "Assigned Officer"; Code[50])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                if USerSetup.Get("Assigned Officer") then begin
                    // USerSetup.CALCFIELDS(USerSetup."E-Mail");
                    "Assigned Officer Email" := USerSetup."E-Mail";
                    "Assigned Officer Name" := USerSetup."Employee Name";
                end;
            end;
        }
        field(69225; "Submitted By"; Code[50])
        {
        }
        field(69226; "Date Submitted"; Date)
        {
        }
        field(69227; "Time Submitted"; Time)
        {
        }
        field(69228; "Created By"; Code[50])
        {
        }
        field(69229; "Date Created"; Date)
        {
        }
        field(69230; "Time Created"; Time)
        {
        }
        field(69231; Enquiry; Boolean)
        {
        }
        field(69232; "Turn Around Time"; Integer)
        {
        }

    }

    keys
    {
        key(Key1; "Resource Assigned", "Enquiry Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Enquiry Number" = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Cases nos");
            NoSeriesMgt.InitSeries(HRSetup."Cases nos", xRec."No. Series", 0D, "Enquiry Number", "No. Series");
        end;

        "Receiving Officer" := UserId;
        "Created By" := UserId;
        "Date Created" := Today;
        "Time Created" := Time;
    end;

    trigger OnModify()
    begin
        /* IF Status=Status::Assigned THEN
         ERROR('You cannot modify a closed case');
         */

    end;

    var
        HRSetup: Record "Crm General Setup.";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        casem: Record "Cases Management";
        casen: Record "Cases Management";
        CPeriod: Integer;
        currYear: Integer;
        StartDate: Date;
        EndDate: Date;
        Month: Integer;
        DAY: Integer;
        Cust: Record Customer;
        ObjUsers: Record User;
        "Customer Mode": Record "Customer Group &  Mode";
        USerSetup: Record "User Setup";
        SMTSetup: Record "Email Account";
        Email: Codeunit Email;
        EmailMsg: Codeunit "Email Message";

    /// <summary>
    /// Reads the "Case Description" value into a stream and outputs the value as a text representation.
    /// </summary>
    /// <returns>A text value, which can be used with a Rich Text Editor.</returns>
    procedure GetRichText(): Text
    var
        InStream: Instream;
        TextValue: Text;
    begin
        Rec.CalcFields(Rec."Case Description");
        Rec."Case Description".CreateInStream(InStream);
        InStream.Read(TextValue);

        exit(TextValue);
    end;

    // 
    /// <summary>
    /// Saves the text parameter in the "Case Description" field.
    /// </summary>
    /// <param name="MyRichText">The value to save in blob field.</param>
    procedure SaveRichText(RichText: Text)
    var
        OutStream: OutStream;
    begin
        Rec."Case Description".CreateOutStream(OutStream);
        OutStream.Write(RichText);
        Rec.Modify();
    end;

    procedure sms()
    var
        iEntryNo: Integer;
    begin

        //SMS MESSAGE
        /*   SMSMessages.RESET;
           IF SMSMessages.FIND('+') THEN BEGIN
           iEntryNo:=SMSMessages."Entry No";
           iEntryNo:=iEntryNo+1;
           END
           ELSE BEGIN
           iEntryNo:=1;
           END;

           SMSMessages.RESET;
           SMSMessages.INIT;
           SMSMessages."Entry No":=iEntryNo;
           SMSMessages."Account No":="Member No";
           SMSMessages."Date Entered":=TODAY;
           SMSMessages."Time Entered":=TIME;
           SMSMessages.Source:='Cases';
           SMSMessages."Entered By":=USERID;
           SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
           //SMSMessages."Sent To Server":=SMSMessages."Sent To Server::No;
           SMSMessages."SMS Message":='Your case/complain has been received and assigned to.'+"Resource#1"+
                                     ' kindly contact the resource for follow ups';
           Cust.RESET;
           IF Cust.GET("Member No") THEN
           SMSMessages."Telephone No" := Cust."Phone No.";
           SMSMessages.INSERT;*/

    end;

    procedure smsResolved()
    var
        iEntryNo: Integer;
        Usersetup: Record User;
        phoneNo: Code[20];
        userAuthorizer: Text;
    begin

        //SMS MESSAGE
        /* SMSMessages.RESET;
         IF SMSMessages.FIND('+') THEN BEGIN
         iEntryNo:=SMSMessages."Entry No";
         iEntryNo:=iEntryNo+1;
         END
         ELSE BEGIN
         iEntryNo:=1;
         END;

         SMSMessages.RESET;
         SMSMessages.INIT;
         SMSMessages."Entry No":=iEntryNo;
         SMSMessages."Account No":="Member No";
         SMSMessages."Date Entered":=TODAY;
         SMSMessages."Time Entered":=TIME;
         SMSMessages.Source:='Cases';
         SMSMessages."Entered By":=USERID;
         SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
         //SMSMessages."Sent To Server":=SMSMessages."Sent To Server::No;
         SMSMessages."SMS Message":='Your case/complain has been resolved by.'+"Resolved User"+
                                   ' Thank you for your being our priority customer';
         Cust.RESET;
         IF Cust.GET("Member No") THEN
         SMSMessages."Telephone No" := Cust."Phone No.";
         SMSMessages.INSERT;*/

    end;

    procedure Sendtouser()
    var
        iEntryNo: Integer;
        Usersetup: Record User;
        phoneNo: Code[20];
        userAuthorizer: Text;
    begin
        /*Usersetup.RESET;
        Usersetup.SETRANGE(Usersetup."User Name","Resource Assigned");
        IF Usersetup.FIND('-')THEN BEGIN
        phoneNo:=Usersetup."Phone No";
        END;
            IF SMSMessage.FIND('+') THEN BEGIN
              iEntryNo:=SMSMessage."Entry No";
              iEntryNo:=iEntryNo+1;
              END
              ELSE BEGIN
              iEntryNo:=1;
              END;
        
              SMSMessage.RESET;
              SMSMessage.INIT;
              SMSMessage."Entry No":=iEntryNo;
              SMSMessage."Account No":=userAuthorizer;
              SMSMessage."Date Entered":=TODAY;
              SMSMessage."Time Entered":=TIME;
              SMSMessage.Source:= 'CASES';
              SMSMessage."Entered By":=USERID;
              SMSMessage."Sent To Server":=SMSMessage."Sent To Server"::No;
              SMSMessage."SMS Message":='Your have been assigned a cases of '+ "Member No"+'of '+"Case Description"+'on'+FORMAT(TODAY)+'at'+FORMAT(TIME)+'kindly give it priority' ;
              SMSMessage."Telephone No":=phoneNo;
              SMSMessage.INSERT;
              */

    end;

    procedure SendEmailuser()
    var
        Usersetup: Record "User Setup";
        phoneNo: Code[20];
        UserEmail: Text;
        CaseRec: Record "Cases Management";
    begin

        SMTSetup.Get;
        if "Assigned Officer" = '' then
            Error('Please assign the case to an officer before sending an email');
        if "Assigned Officer Email" = '' then
            Error('Please assign the case to an officer with an email address before sending an email');
        case
            "Interaction Type" of
            "Interaction Type"::Complaint, "Interaction Type"::Enquiry:
                begin
                    EmailMsg.Create("Assigned Officer Email", 'Case Assigned', 'Dear ' + "Assigned Officer Name" + ',  Your have been assigned an interaction from ' + "Received From" + 'With the following message:<br>' +
                           GetRichText() + '<br> on ' + Format(Today) + ' at ' + Format(Time) + '.<br> Kindly give it priority.', true);
                    Email.Send(EmailMsg, "Email Scenario"::"Interaction Template");
                end;
            "Interaction Type"::Suggestion, "Interaction Type"::Feedback:
                begin
                    EmailMsg.Create("Assigned Officer Email", 'Feedback and Suggestion', 'Dear ' + "Assigned Officer Name" + ',  We have received the following feedback from our client:<br>' +
                           GetRichText() + '<br> on ' + Format(Today) + ' at ' + Format(Time) + '.<br> Kindly consider the feedback.', true);
                    Email.Send(EmailMsg, "Email Scenario"::"Interaction Template");
                end;
            "Interaction Type"::Compliment:
                begin
                    EmailMsg.Create("Assigned Officer Email", 'Compliment', 'Dear ' + "Assigned Officer Name" + ',  We have received the following compliment from our client:<br>' +
                                               GetRichText() + '<br> on ' + Format(Today) + ' at ' + Format(Time) + '.<br> Keep up the good work!!.', true);
                    Email.Send(EmailMsg, "Email Scenario"::"Interaction Template");
                end;
        end;



    end;

    procedure Emailcustomer()
    var
        CustomerEmailtext: Text;
    begin
        /*IF memb.GET("Member No")THEN BEGIN
          CustomerEmailtext:=memb."E-Mail (Personal)";
          END ELSE
          CustomerEmailtext:=memb."E-Mail";
        GenSetUp.GET();
        IF GenSetUp."Send Email Notifications" = TRUE THEN BEGIN
         //notifymail.CreateMessage('Cases Reported',GenSetUp."Sender Address",UserEmail,'Your have been assigned a cases of '+ "Member No"+'of '+"Case Description"+'on'+FORMAT(TODAY)+'at'+FORMAT(TIME)+'kindly give it priority',FALSE);
        notifymail.CreateMessage(USERID,GenSetUp."Sender Address",{CustomerEmailtext}'petermwololo2@gmail.com','Case Reported','Dear '+memb.Name+' Your case/complain has been fully resolved by '+' User: '+ USERID+' ' +"Case Description"+' on '
        +FORMAT(TODAY)+'thank you  for being our customer',FALSE);
        
        
        notifymail.Send;
        
        
        
        END;
        */

    end;
}

