
Table 69055 "Employee Transfers"
{
    LookupPageId = "Employee Transfer List";
    DrillDownPageId = "Employee Transfer List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Employee No"; Code[10])
        {
            TableRelation = Employee."No.";
            trigger OnValidate()
            var
                myInt: Integer;

            begin
                Employee.Reset();
                Employee.SetRange("No.", "Employee No");
                if Employee.FindFirst() then
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                "Job Title" := Employee."Job Title2";
                Employee.TestField("Current Duty Station");
                "Original Station" := Employee."Current Duty Station";
                // "PREV Transfer Date" := Employee."EMP Transfer Date";
                // "PREV Reporting Date" := Employee."EMP Reporting Date";
                // "PREV Actual Reporting Date" := Employee."EMP Actual Reporting Date";
                // "Current Implementing Unit" := Employee."Implementing Unit Name";
                // if (Rec.Type = Rec.Type::"Self initiated") and (Employee."EMP Actual Reporting Date" <> 0D) then begin

                //     Hrsetup.get;
                //     ExpectedDate := CalcDate(Hrsetup."Minimum Station Yrs of Service", Employee."EMP Actual Reporting Date");
                //     if ExpectedDate > TODAY THEN BEGIN
                //         ERROR('ERROR! You must have served for atleast %1 on the current station', Hrsetup."Minimum Station Yrs of Service");
                //     END;
                // end;
                Employee2.reset();
                Employee2.SetRange("Current Duty Station", Employee."Current Duty Station");
                Employee2.SetRange("Head of Station", true);
                if employee2.FINDFIRST() then BEGIN
                    Rec."HOS PJ No" := employee2."No.";
                    Rec."HOS Name" := employee2."First Name" + ' ' + employee2."Middle Name" + ' ' + employee2."Last Name";
                    Rec."HOS Job Title" := employee2."Job Title2";

                END;


                Email := Employee."Company E-Mail";
                PLWD := Employee.Disabled;
                Gender := Employee.Gender;
                Designation := Employee.Present;
                "Job Grade" := Employee."Current Job Grade";
                "Requesting Station" := Employee."Current Duty Station";
                Age := Employee.Age;
                Rec.Validate("Original Station");
            end;
        }
        field(3; "Employee Name"; Text[250])
        {
        }
        field(4; "Original Station"; Code[30])
        {
            Caption = 'Current Station Code';
            TableRelation = "Duty Station".Code;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                DutyStation.Reset();
                DutyStation.SetRange(Code, "Original Station");
                if DutyStation.FindFirst() then
                    "Original Station Name" := DutyStation.Description;

            end;
        }
        field(5; "New Station"; Code[30])
        {
            Caption = 'New Station Code';
            TableRelation = "Duty Station".Code;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                DutyStation.Reset();
                DutyStation.SetRange(Code, "New Station");
                if DutyStation.FindFirst() then
                    "New Sattion Name" := DutyStation.Description;
                "To Hardship Area?" := DutyStation."Hardship Area";
                EMPTRANS.Reset();
                EMPTRANS.SetRange("Employee No", Rec."Employee No");
                EMPTRANS.SetRange(Posted, true);
                EMPTRANS.SetRange("Original Station", Rec."New Station");
                if EMPTRANS.FindFirst() then begin
                    ERROR('ERROR! No staff goes back to the station where he/she has served');
                end;
                IF DutyStation."Hardship Area" = TRUE THEN BEGIN
                    EMPTRANS.Reset();
                    EMPTRANS.SetRange("Employee No", Rec."Employee No");
                    EMPTRANS.SetRange(Posted, true);

                    EMPTRANS.SetRange("To Hardship Area?", true);
                    if EMPTRANS.FindFirst() then begin
                        ERROR('ERROR! No staff goes back to another hardship area after serving there');
                    end;
                END;
                IF Rec."New Station" = Rec."Original Station" THEN begin
                    ERROR('ERROR! This is the Current Station that the staff is stationed at');
                end;

            end;
        }
        field(6; "Original Station Name"; Text[250])
        {
            Caption = 'Current Station Name';
            Editable = false;


        }
        field(7; "New Sattion Name"; Text[50])
        {
            Caption = 'New Station Name';
            Editable = false;
        }
        field(8; "Transfer Date"; Date)
        {
        }
        field(9; "Transfered By"; Code[30])
        {
        }
        field(10; "To Hardship Area?"; Boolean)
        {
        }
        field(11; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released,Rejected,Awaiting HOS,HOS Confirmed,Pending HOS Reccomendation,Pending Mobility Officer,Pending Head of Mobility,Pending HR Approval,Pending Current HOS Release,Submitted';
            OptionMembers = Open,"Pending Approval",Released,Rejected,"Awaiting HOS","HOS Confirmed","Pending HOD Reccomendation","Pending Mobility Officer","Pending Head of Mobility","Pending HR Approval","Pending Current HOS Release",Submitted;
            Editable = false;

        }
        field(12; "Document No"; Code[10])
        {
            Editable = false;
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
        }
        field(14; "Created By"; Code[20])
        {
            Editable = false;
        }
        field(15; "Date Created"; Date)
        {
            Editable = false;
        }
        field(16; "Time Created"; Time)
        {
            Editable = false;
        }
        field(17; Distance; Decimal)
        {
            caption = 'Baggage Allowance Distance(KMs)';
        }
        field(18; Type; Option)
        {
            OptionCaption = 'Self initiated, Management initiated,...,Bulk Management initiated,Employee Requisition,Mgt Initiated Deployment';
            OptionMembers = "Self initiated","Management initiated","...","Bulk Management initiated","Employee Requisition","Mgt Initiated Deployment";
            Editable = false;
        }
        //Self initiated, Management initiated
        field(19; Posted; Boolean)
        {
        }
        field(20; "Posted On"; DateTime)
        {
        }
        field(21; "Remarks"; Text[1000])
        {
            caption = 'Reason(s) for the Request';
            TableRelation = "Transfer Reasons";
        }
        //Current HOS
        field(91; "Current HOS Remarks"; Text[1000])
        {
            caption = 'Current HOS Comments';
            // TableRelation = "Transfer Reasons";
        }
        field(22; "Suggested Station 1"; Code[30])
        {
            caption = 'Preferred Station 1 Code';
            TableRelation = "Duty Station".Code;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                DutyStation.Reset();
                DutyStation.SetRange(Code, "Suggested Station 1");
                if DutyStation.FindFirst() then
                    "Suggested Station 1 Name" := DutyStation.Description;
                ;

            end;
        }
        field(23; "Suggested Station 1 Name"; Text[1000])
        {
            caption = 'Preferred Station 1 Name';
        }
        field(24; "Suggested Station 2"; Code[30])
        {
            caption = 'Preferred Station 2 Code';

            TableRelation = "Duty Station".Code;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                DutyStation.Reset();
                DutyStation.SetRange(Code, "Suggested Station 2");
                if DutyStation.FindFirst() then
                    "Suggested Station 2 Name" := DutyStation.Description;


            end;
        }
        field(25; "Suggested Station 2 Name"; Text[1000])
        {
            caption = 'Preferred Station 2 Name';
        }
        field(26; "Suggested Station 3"; Code[30])
        {
            caption = 'Preferred Station 3 Code';

            TableRelation = "Duty Station".Code;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                DutyStation.Reset();
                DutyStation.SetRange(Code, "Suggested Station 3");
                if DutyStation.FindFirst() then
                    "Suggested Station 3 Name" := DutyStation.Description;


            end;
        }
        field(27; "Suggested Station 3 Name"; Text[1000])
        {
            caption = 'Preferred Station 3 Name';
        }
        field(28; "Request Date"; Date)
        {
            Editable = false;
        }
        field(29; "Job Title"; Text[250])
        {
            Caption = 'Designation';
            Editable = false;
        }
        field(30; "Document Type"; Option)
        {
            OptionCaption = 'Application,Professional Opinion,Employee Requisition';
            OptionMembers = Application,"Professional Opinion","Employee Requisition";
            Editable = false;
        }
        field(31; "Requesting Station  Name"; Text[1000])
        {
            caption = 'Requesting station Name';
        }
        field(32; "Requesting Station"; Code[30])
        {
            caption = 'Requesting station code';
            TableRelation = "Duty Station".Code;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                DutyStation.Reset();
                DutyStation.SetRange(Code, "Requesting Station");
                if DutyStation.FindFirst() then
                    "Requesting Station  Name" := DutyStation.Description;


            end;
        }
        field(33; "Transfer No"; Code[30])
        {


        }
        field(34; "Professional Opinion"; Text[1000])
        {
            caption = 'HOS Recommendation';
        }
        field(35; "Transfer Reason Code"; Code[40])
        {
            TableRelation = if ("Document Type" = const(Application)) "Transfer Reasons"."Reason Code" where("Applicable Area" = filter(Application))
            else
            if ("Document Type" = const("Employee Requisition")) "Transfer Reasons"."Reason Code" where("Applicable Area" = filter("Employee Requisition"));
            trigger OnValidate()
            var
                myInt: Integer;
                Reason: Record "Transfer Reasons";
            begin
                Reason.Reset();
                Reason.SetRange("Reason Code", Rec."Transfer Reason Code");
                if Reason.FindFirst() then
                    Remarks := Reason.Description;
            end;
        }
        field(36; "Reporting Date"; Date)
        {
            Editable = false;
        }
        field(37; "Email"; Text[100])
        {
            Editable = false;
        }
        field(38; "Actual Reporting Date"; Date)
        {
            //  Editable = false;
        }
        field(70025; "PLWD"; Boolean)
        {
            Editable = false;

        }
        field(50115; Age; Text[80])
        {
            Editable = false;
        }
        field(70027; "Transfer Appeal"; Boolean)
        {
            Editable = false;

        }
        field(70028; "Reason(s) for Appeal"; Text[1000])
        {
        }
        field(70029; "Original Transfer No"; Code[50])
        {
        }
        field(70030; "Job Cadre"; Code[50])
        {
            TableRelation = "Cadre Groups Setup".Code;
        }
        field(70031; "Gender"; Option)
        {
            OptionMembers = ,Female,Male,Others;
        }
        field(70032; "Designation"; Code[50])
        {
            TableRelation = "Company Positions";
        }
        field(70033; "Job Grade"; Code[50])
        {
            TableRelation = "Salary Scales";
        }
        field(70034; "Job Description"; Code[50])
        {

        }
        field(70035; "No of Employee Requested"; Integer)
        {

        }
        field(70095; "PREV Transfer Date"; date)
        {
            caption = 'Previous Station  Transfer Request Date';
        }
        field(70096; "PREV Reporting Date"; date)
        {
            caption = 'Previous Station  Reporting Date';
        }
        field(70097; "PREV Actual Reporting Date"; date)
        {
            caption = 'Previous Station Actual Reporting Date';
        }

        field(70098; "HOS PJ No"; Code[10])
        {
            caption = 'Head of Station';
            Editable = FALSE;
            TableRelation = Employee."No.";
            trigger OnValidate()
            var
                myInt: Integer;

            begin
                Employee.Reset();
                Employee.SetRange("No.", "Employee No");
                if Employee.FindFirst() then
                    "HOS Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                "HOS Job Title" := Employee."Job Title2";

            end;
        }
        field(70099; "HOS Name"; Text[250])
        {
            Editable = FALSE;
        }
        field(70100; "HOS Job Title"; Text[250])
        {
            Editable = FALSE;
        }
        field(70101; "Mobility Recommendation"; Text[1000])
        {
        }
        field(70102; "HOD Mobility Recommendation"; Text[1000])
        {
            Caption = 'HOS Mobility Recommendation';
        }
        field(70103; "HOD HR Recommendation"; Text[1000])
        {
            Caption = 'Director HR Recommendation';
        }
        field(70104; "Mobility Observations"; Text[1000])
        {
        }
        //Mobility Observations 
        field(70105; "Release Date"; Date)
        {

        }

        field(70106; "Mobility Release Date"; Date)
        {

        }
        field(70107; "Requestor Employee No"; Code[10])
        {
            TableRelation = Employee."No.";
            trigger OnValidate()
            var
                myInt: Integer;

            begin
                Employee.Reset();
                Employee.SetRange("No.", "Requestor Employee No");
                if Employee.FindFirst() then
                    "Requestor Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                "Requestor Job Title" := Employee."Job Title2";

            end;
        }
        field(70108; "Requestor Name"; Text[250])
        {
        }
        field(70109; "Requestor Job Title"; Text[250])
        {
            Caption = 'Designation';
            Editable = false;
        }
        field(70110; "Request Type"; Option)
        {
            OptionCaption = '...,Replacement';
            OptionMembers = "...",Replacement;
            //Editable = false;
        }
        field(70111; "Replacement Request No"; Code[10])
        {
            TableRelation = if ("Request Type" = const(Replacement)) "Employee Transfers"."Document No" where(Type = const("Self initiated"), Status = filter(<> 'Open'));

        }
        field(70112; "Bulk Transfers Request No"; Code[10])
        {
            TableRelation = "Employee Transfers"."Document No" where(Type = const("Self initiated"));
            Editable = false;

        }

        field(70113; "Current Implementing Unit"; Text[100])
        {
            DataClassification = ToBeClassified;

        }

        field(70114; "New Implementing Unit"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate | "Court Stations" | "Department/Center" | "Division/Section" | Office));
            trigger OnValidate()
            var
                RespCenter: Record "Responsibility Center";
            begin
                if RespCenter.Get("New Implementing Unit") then
                    "New Implementing Name" := RespCenter.name;
            end;
        }

        field(70115; "Deployment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(70116; "New Implementing Name"; Text[100])
        {
            DataClassification = ToBeClassified;


        }
        //Bulk Transfers Request


    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Document No", "Employee Name")
        {

        }
    }
    trigger OnInsert()
    begin
        // if "Document No" = '' then begin
        //     IF Rec."Document Type" = Rec."Document Type"::"Professional Opinion" then begin

        //         HRSetup.Get;
        //         HRSetup.TestField("Transfer Opinion Nos");
        //         NoSeriesMgt.InitSeries(HRSetup."Transfer Opinion Nos", xRec."Document No", 0D, "Document No", "No. Series");
        //         //   end;
        //     end else begin
        //         // if "Document No" = '' then begin
        //         HRSetup.Get;
        //         HRSetup.TestField("Employee Transfer Nos");
        //         NoSeriesMgt.InitSeries(HRSetup."Employee Transfer Nos", xRec."Document No", 0D, "Document No", "No. Series");


        //     end;
        // end;
        "Created By" := UserId;
        "Time Created" := Time;
        "Date Created" := Today;
        // if type = type::"Management initiated" then begin
        //     usersetup.Reset();
        //     //"Raise Management Transfers ?"
        //     usersetup.SetRange("Raise Management Transfers ?", false);
        //     usersetup.SetRange("User ID", UserId);
        //     if usersetup.FindFirst() then
        //         Error('Error! Kindly Ensure you have the necessary rights to Raise a management Initated Transfer');
        // end;


        // if type <> type::"Management initiated" then begin
        //     usersetup.Reset();
        //     usersetup.SetRange("User ID", UserId);
        //     if usersetup.FindFirst() then
        //         Employee.Reset();
        //     Employee.SetRange("No.", usersetup."Employee No.");
        //     if Employee.FindFirst() then
        //         "Employee No" := usersetup."Employee No.";
        //     "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
        //     "Job Title" := Employee."Job Title2";
        //     Email := Employee."Company E-Mail";
        //     PLWD := Employee.Disabled;
        //     Age := Employee.Age;
        //     Gender := Employee.Gender;
        //     Designation := Employee.Present;
        //     "Job Grade" := Employee."Current Job Grade";
        //     "Requesting Station" := Employee."Current Duty Station";
        //     Employee2.reset();
        //     Employee2.SetRange("Current Duty Station", Employee."Current Duty Station");
        //     Employee2.SetRange("Head of Station", true);
        //     if employee2.FINDFIRST() then BEGIN
        //         Rec."HOS PJ No" := employee2."No.";
        //     END;
        // //    Employee.TestField("Current Duty Station");
        //     "Original Station" := Employee."Current Duty Station";
        //     "PREV Transfer Date" := Employee."EMP Transfer Date";
        //     "PREV Reporting Date" := Employee."EMP Reporting Date";
        //     "PREV Actual Reporting Date" := Employee."EMP Actual Reporting Date";
        //     if (Rec.Type = Rec.Type::"Self initiated") and (Employee."EMP Actual Reporting Date" <> 0D) then begin
        //         Hrsetup.get;
        //         ExpectedDate := CalcDate(Hrsetup."Minimum Station Yrs of Service", Employee."EMP Actual Reporting Date");
        //         if ExpectedDate > TODAY THEN BEGIN
        //             ERROR('ERROR! You must have served for atleast %1 on the current station', Hrsetup."Minimum Station Yrs of Service");
        //         END;
        //     end;
        //     Rec.Validate("Original Station");
        // end;
    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        // if Status = Status::Rejected then begin
        //     SendRejection()
        // end;
        // if Status = Status::"Awaiting HOS" then begin
        //     SendApproved()
        // end;

    end;

    var
        HRSetup: Record "Human Resources Setup";
        // Hrsetup: Record "Human Resources Setup";
        ExpectedDate: Date;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DutyStation: Record "Duty Station";
        // financialYear: Record "Financial Year Code";
        Employee: record Employee;
        employee2: record Employee;
        usersetup: record "User Setup";
        EMPTRANS: Record "Employee Transfers";


    procedure SendRejection()
    // var
    //     // Email: Codeunit Email;
    //     // EmailMessage: Codeunit "Email Message";

    //     Email: Codeunit Email;
    //     EmailMessage: Codeunit "Email Message";
    //     Employee: Record Employee;
    //     SendToList: List of [Text];
    //     SendToList2: List of [Text];
    //     SendToList3: List of [Text];
    //     OutStr: OutStream;
    //     InStr: InStream;
    //     OutStr2: OutStream;
    //     InStr2: InStream;
    //     BodyTxt: Text;
    //     TempBlob: Codeunit "Temp Blob";
    //     RecRef: RecordRef;
    //     BulkProcessingHead: Record "Employee Transfers";
    // begin
    //     EmailMessage.Create(Rec.Email, 'Employee Transfer Rejection', 'Dear ' + "Employee Name"
    //     + '<BR></BR>This is to notify you that your application for Station Transfer No ' + "Document No"
    //     + ' has been declined because of <B>' + Remarks + '</B><BR></BR>' +
    //     'Kindly Log into the system and check', true);
    //     Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Employee: Record Employee;
        SendToList: List of [Text];
        SendToList2: List of [Text];
        SendToList3: List of [Text];
        OutStr: OutStream;
        InStr: InStream;
        OutStr2: OutStream;
        InStr2: InStream;
        BodyTxt: Text;
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        BulkProcessingHead: Record "Employee Transfers";
    begin
        Rec."Reporting Date" := CalcDate('30D', TODAY);
        BulkProcessingHead.SetRange("Document No", Rec."Document No");
        RecRef.GetTable(BulkProcessingHead);
        TempBlob.CreateOutStream(OutStr);
        // Report.SaveAs(Report::"Rejected Transfer  Letter", '', ReportFormat::Pdf, OutStr, RecRef);
        TempBlob.CreateInStream(InStr);
        InStr.ReadText(BodyTxt);
        TempBlob.CreateOutStream(OutStr2);
        // Report.SaveAs(Report::"Rejected Transfer  Letter", '', ReportFormat::Pdf, OutStr, RecRef);
        TempBlob.CreateInStream(InStr2);
        Employee.reset();
        Employee.SetRange("Current Duty Station", Rec."Original Station");
        Employee.SetRange("Head of Station", true);
        if employee.findset then
            SendToList.Add(Rec.Email);
        SendToList2.Add(Employee."Company E-Mail");
        SendToList3.Add(Employee."Company E-Mail");

        if Rec.Type = Rec.Type::"Self initiated" then begin
            EmailMessage.Create(SendToList, 'Employee Transfer Rejection', 'Dear ' + "Employee Name"
        + '<BR></BR>This is to notify you that your application for Station Transfer No ' + "Document No"
        + ' has been declined because of <B>' + Remarks + '</B><BR></BR>' +
        'Kindly Log into the system and check', true, SendToList2, SendToList3);
        end;




        EmailMessage.AddAttachment('attachment.pdf', 'PDF', InStr2);

        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SendApproved()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Employee: Record Employee;
        SendToList: List of [Text];
        SendToList2: List of [Text];
        SendToList3: List of [Text];
        OutStr: OutStream;
        InStr: InStream;
        OutStr2: OutStream;
        InStr2: InStream;
        BodyTxt: Text;
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        BulkProcessingHead: Record "Employee Transfers";
    begin
        Rec."Reporting Date" := CalcDate('30D', TODAY);
        BulkProcessingHead.SetRange("Document No", Rec."Document No");
        RecRef.GetTable(BulkProcessingHead);
        TempBlob.CreateOutStream(OutStr);
        // Report.SaveAs(Report::"Employee Transfer Letter", '', ReportFormat::Pdf, OutStr, RecRef);
        TempBlob.CreateInStream(InStr);
        InStr.ReadText(BodyTxt);
        TempBlob.CreateOutStream(OutStr2);
        // Report.SaveAs(Report::"Employee Transfer Letter", '', ReportFormat::Pdf, OutStr, RecRef);
        TempBlob.CreateInStream(InStr2);
        Employee.reset();
        Employee.SetRange("Current Duty Station", Rec."New Station");
        Employee.SetRange("Head of Station", true);
        if employee.findset then
            SendToList.Add(Rec.Email);
        Employee.reset();
        Employee.SetRange("Current Duty Station", Rec."Original Station");
        Employee.SetRange("Head of Station", true);
        if employee.findset then
            SendToList.Add(Rec.Email);
        SendToList2.Add(Employee."Company E-Mail");
        SendToList3.Add(Employee."Company E-Mail");

        if Rec.Type = Rec.Type::"Self initiated" then begin
            EmailMessage.Create(SendToList, 'Subject: Transfer Approval Notification ' + "Document No", 'Dear ' + "Employee Name"
       + '<BR></BR>This is to notify you that Duty Station Transfer No ' + "Document No"
       + ' from has been Approved. You are required to report to This station <B> ' + "New Sattion Name" + '</B>' + '<BR></BR>' +
       'To the respective Heads of Station Please be informed that ' + "Employee Name" + ' to ' + "New Sattion Name" + ' has been approved.' + '<BR></BR>' +
       'Kindly Log into the system and check', true, SendToList2, SendToList3);
        end;

        if Rec.Type = Rec.Type::"Management initiated" then begin
            EmailMessage.Create(SendToList, 'Subject: Transfer Approval Notification ' + "Document No", 'Dear ' + "Employee Name"
       + '<BR></BR>This is to notify you that Duty Station Transfer No ' + "Document No" + 'from ' + "Original Station Name" + 'to ' + "New Sattion Name" + ' has been Approved. You are required to report to This station <B> ' + "New Sattion Name" + '</B>' + '<BR></BR>' +
       'To the respective Heads of Station Please be informed that ' + "Employee Name" + ' to ' + "New Sattion Name" + ' has been approved.' + '<BR></BR>' +
       'Kindly Log into the system and check', true, SendToList2, SendToList3);
        end;


        EmailMessage.AddAttachment('attachment.pdf', 'PDF', InStr2);

        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;


}

