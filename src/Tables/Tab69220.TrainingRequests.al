
table 69220 "Training Requests"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Editable = true;

            trigger OnValidate()
            begin
                if "Available Funds" <> xRec."Available Funds" then begin
                    HRSetup.Get;
                    NoSeriesMgt.TestManual(HRSetup."Training Application Nos.");
                    Code := '';
                end;
            end;
        }
        field(2; "Course Title"; Code[20])
        {
            NotBlank = false;
            TableRelation = if ("Funding Source" = const(self)) "Training Courses Setup"
            else
            "Training Plan Lines"."Course Title" where("Training Plan Code" = field("Training Plan No."));
            ValidateTableRelation = false;
            trigger OnValidate()
            var
                Course: Record "Training Courses Setup";
            begin
                TrainingPlanLines.Reset;
                TrainingPlanLines.SetRange("Course Title", "Course Title");
                if TrainingPlanLines.FindSet then begin
                    TrainingPlanLines.CalcFields("Course Description");
                    Description := TrainingPlanLines."Course Description";
                end;
                PlanningLineEntry.Reset;
                PlanningLineEntry.SetRange("Course ID", "Course Title");
                if PlanningLineEntry.FindSet then begin
                    TrainingPlanLines.Reset;
                    TrainingPlanLines.SetRange("Course Title", PlanningLineEntry."Course ID");
                    if TrainingPlanLines.FindSet then begin
                        TrainingPlanLines.CalcFields("Course Description");
                        Description := TrainingPlanLines."Course Description";
                    end;
                    // "Start Date" := PlanningLineEntry."Planned Start Date";
                    "Training Duration Hrs" := PlanningLineEntry."Training Duration Hrs";
                    // "End Date" := PlanningLineEntry."Planned End Date";
                    Validate("End Date");
                    Provider := PlanningLineEntry."Planned Service Provider";
                    PlanningLineEntry.CalcFields("Planned Service Provider Name");
                    "Provider Name" := PlanningLineEntry."Planned Service Provider Name";
                    "Planned Budget" := PlanningLineEntry."Planned Budget";
                    "Planned No. to be Trained" := PlanningLineEntry."Planned No. to be Trained";
                    "Training Type" := PlanningLineEntry."Training Type";

                end;
                if Course.Get("Course Title") then
                    if Course.Bonded then begin
                        Bonded := Course.Bonded;
                        "Bonding Period" := Course."Bonding Period";
                        "Bond Penalty" := Course."Bonding Penalty";
                        if "End Date" <> 0D then begin
                            "Expected Bond Start" := "End Date";
                            "Expected Bond End" := CalcDate("Bonding Period", "Expected Bond Start");
                        end;
                    end
                    else begin
                        Bonded := false;
                        Clear("Bonding Period");
                        Clear("Bond Penalty");
                        Clear("Expected Bond Start");
                        Clear("Expected Bond End");

                    end;
                Description := Course.Descritpion;

                if "Training Plan No." <> '' then
                    if "Training Venue Region Code" <> '' then
                        fnSuggestParticipants();
            end;
        }
        field(3; "Start Date"; Date)
        {
            //Editable = false;
            trigger OnValidate()

            var
                courseSetup: Record "Training Courses Setup";
            begin
                TestField("Start Date");
                courseSetup.reset();
                if courseSetup.get("course title") then begin
                    courseSetup.TestField(courseSetup."Course Duration");
                    "End Date" := calcdate(courseSetup."Course Duration", "Start Date");
                end

                // if "End Date" - "Start Date" + 1 > 366 then
                //     "Duration Type" := "Duration Type"::"Long Course"
                // else
                //     "Duration Type" := "Duration Type"::"Short Course";
                // Duration := "End Date" - "Start Date";
            end;
        }
        field(4; "End Date"; Date)
        {
            Editable = false;
            // trigger OnValidate()

            // var
            //     courseSetup: Record "Training Courses Setup";
            // begin
            //     TestField("Start Date");
            //     courseSetup.reset();
            //     if courseSetup.get("course title") then begin
            //         courseSetup.TestField(courseSetup."Course Duration");
            //         "End Date" := calcdate(courseSetup."Course Duration", "Start Date");
            //     end

            // if "End Date" - "Start Date" + 1 > 366 then
            //     "Duration Type" := "Duration Type"::"Long Course"
            // else
            //     "Duration Type" := "Duration Type"::"Short Course";
            // Duration := "End Date" - "Start Date";
            // end;

        }
        field(5; "Duration Units"; Option)
        {
            Editable = false;
            Enabled = false;
            OptionMembers = Hours,Days,Weeks,Months,Years;
        }
        field(6; Duration; Decimal)
        {
            Editable = true;
        }
        field(7; Cost; Decimal)
        {
            // Editable = false;
        }
        field(8; Location; Text[30])
        {
            Editable = false;
        }
        field(9; Description; Text[100])
        {
            //Editable = false;
        }
        field(10; Year; Integer)
        {
        }
        field(11; Provider; Code[20])
        {
            Editable = false;
            TableRelation = Vendor;
            ValidateTableRelation = false;
            trigger OnValidate()
            begin
                Vend.Reset;
                Vend.SetRange(Vend."No.", Provider);
                if Vend.Find('-') then begin
                    "Provider Name" := Vend.Name;
                end;
            end;
        }
        field(12; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Pending Commitee Approval,Approved,Rejected,Closed';
            OptionMembers = Open,"Pending Approval","Pending Commitee",Approved,Rejected,Closed;
            trigger OnValidate()
            var
                Email: Codeunit Email;
                EmailMessage: Codeunit "Email Message";
                Body: Text;
                Recipient: List of [Text];
                Emp: Record Employee;
                PayChange: Record "prBasic pay PCA";
                Lines: Record "prEmployee Trans PCA";
                PRSetup: Record "PR Vital Setup Info";
                TransCode: Record "PR Transaction Codes";
            begin

                Clear(Recipient);
                if (Status in [Status::Approved, Status::Rejected]) and ("Funding Source" <> "Funding Source"::Internal) then begin

                    TrainingParticipants.Reset();
                    TrainingParticipants.SetRange("Training Code", Rec.Code);
                    TrainingParticipants.SetRange("Charge Levy", true);
                    if TrainingParticipants.FindSet() then begin
                        PRSetup.Get();
                        PRSetup.TestField("Int. Training Levy");
                        PRSetup.TestField("Local Training Levy");
                        repeat
                            PayChange.Init();
                            PayChange.Validate("Employee Code", TrainingParticipants."Employee Code");
                            PayChange."Source Document" := PayChange."Source Document"::Training;
                            PayChange."Document No" := TrainingParticipants."Training Code";
                            PayChange.Insert(true);
                            Lines.Init();
                            if TrainingRequest."Training Region" = TrainingRequest."Training Region"::Overseas then
                                Lines.validate("Transaction Code", PRSetup."Int. Training Levy")
                            else
                                Lines.validate("Transaction Code", PRSetup."Local Training Levy");
                            Lines."Employee Code" := PayChange."Employee Code";
                            Lines."Change Advice Serial No." := PayChange."Change Advice Serial No.";
                            Lines.Amount := PayChange."Basic Pay" * TransCode."Formula %" / 100;
                            Lines.Insert();
                            if Status = Status::Approved then begin
                                if (Emp.Get("Employee No.")) and (Emp."Company E-Mail" <> '') then begin
                                    Recipient.Add(Emp."Company E-Mail");
                                    Body := 'Dear ' + TrainingParticipants."Employee Name" + ',';
                                    Body += 'You have been selected to attend training for <strong>' + Description + '</strong>';
                                    Body += '<br>The training will be held from <strong>' + Format("Start Date") + '</strong> to <strong>' + Format("End Date") + '</strong> at ' + "Training Venue Region";
                                end;
                            end;
                            EmailMessage.Create(Recipient, 'Training Application ' + Code, Body, true);
                            Email.Send(EmailMessage);

                        until TrainingParticipants.Next() = 0;
                    end;


                end;
            end;
        }
        field(13; "Employee No."; Code[10])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
            trigger OnValidate()

            var
                Empl: record Employee;
            begin
                //Ian Casper****Check if employee has been to training for the past two years
                // TrainingRequest.Reset();
                // TrainingRequest.SetRange("Employee No.", Rec."Employee No.");
                // TrainingRequest.Setfilter(Status, '=%1|%2', TrainingRequest.Status::Approved, TrainingRequest.Status::Closed);
                // TrainingRequest.setfilter("End Date", '>%1', CalcDate('-2Y', Today));
                // TrainingRequest.SetRange("Training Type", TrainingRequest."Training Type"::Internal);
                // if TrainingRequest.FindFirst() then
                //     Error('You cannot apply for another internal training until %1. Two years have to have elapsed since your last training', CalcDate('2Y', TrainingRequest."End Date"));
                if Empl.Get("Employee No.") then begin

                    "Employee Name" := Empl.fullname();
                    // "Employee Department" := Empl.department;
                    "Global Dimension 1 Code" := Empl."Global Dimension 1 Code";

                end;
            end;
        }
        field(14; "Application Date"; Date)
        {
            Editable = false;
        }
        field(15; "No. Series"; Code[10])
        {
        }
        field(16; "Employee Department"; Code[10])
        {
            Caption = 'Directorate Code';
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));
        }
        field(17; "Employee Name"; Text[150])
        {
        }
        field(18; "Provider Name"; Text[150])
        {
        }
        field(19; "No. of Participants"; Integer)
        {
            trigger OnValidate()
            var
                EmpVar: Code[20];
                Participants: Record "Training Participants";
            begin
                "No. of Participants" := 0;
                // Participants.Reset();
                // Participants.SetCurrentKey("Employee Code");
                // Participants.SetAscending("Employee Code", true);
                // Participants.SetRange("Training Code", Rec.Code);
                // if Participants.FindSet() then
                //     repeat
                //         if EmpVar <> Participants."Employee Code" then
                //             "No. of Participants" += 1
                //     until Participants.Next() = 0;
            end;
        }
        field(20; "Approved Cost"; Decimal)
        {
        }
        field(21; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1), Blocked = const(false));
        }
        field(22; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2), Blocked = const(false));
        }
        field(23; "Actual Start Date"; Date)
        {

            trigger OnValidate()
            var
                NullDate: DateFormula;
            begin
                /*IF Duration <> NullDate THEN
                IF "Actual Start Date" <> 0D THEN BEGIN
                "Actual End Date" := CALCDATE(Duration,"Actual Start Date");
                END
                ELSE
                "Actual End Date" :=  0D;
                */

            end;
        }
        field(24; "Actual End Date"; Date)
        {
        }
        field(25; "Estimated Cost"; Decimal)
        {
            CalcFormula = sum("Training Cost".Cost where("Training ID" = field("Course Title")));
            FieldClass = FlowField;
        }
        field(26; "Imprest Created"; Boolean)
        {
        }
        field(27; "Training Plan Cost"; Decimal)
        {
            CalcFormula = sum("Training Cost"."Line Amount" where("Training ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(28; Budget; Decimal)
        {
            CalcFormula = sum("G/L Budget Entry".Amount where("G/L Account No." = field("GL Account")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; Actual; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("GL Account")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; Commitment; Decimal)
        {
            Editable = false;
        }
        field(31; "GL Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(32; "Budget Name"; Code[10])
        {
            Caption = 'Fiscal Year';
            TableRelation = "G/L Budget Name";
        }
        field(33; "Available Funds"; Decimal)
        {
        }
        field(34; "Local"; Option)
        {
            OptionMembers = "Local",Abroad;
        }
        field(35; "Requires Flight"; Boolean)
        {
        }
        field(36; "Supervisor No."; Code[10])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(37; "Supervisor Name"; Text[50])
        {
        }
        field(38; "Training Plan No."; Code[30])
        {
            TableRelation = "Training Plan Header".No;

            trigger OnValidate()
            begin
                //VALIDATE("Training Plan No.");
                if "Course Title" <> '' then
                    if "Training Venue Region Code" <> '' then
                        fnSuggestParticipants();
            end;
        }
        field(39; "Training Plan Description"; Text[100])
        {
            CalcFormula = lookup("Training Plan Header".Description where(No = field("Training Plan No.")));
            FieldClass = FlowField;
        }
        field(40; "Created By"; Code[30])
        {
        }
        field(41; "Created On"; Date)
        {
        }
        field(42; "Training Type"; Option)
        {
            OptionCaption = 'OnSite,OffSite,Virtual';
            OptionMembers = Internal,External,Virtual;
        }
        field(43; "Training Duration Hrs"; Decimal)
        {
        }
        field(44; "Planned Budget"; Decimal)
        {
        }
        field(45; "Planned No. to be Trained"; Integer)
        {
        }
        field(46; "Total Per diem Costs"; Decimal)
        {
            // CalcFormula = sum("Training Participants"."Total Amount" where("Training Code" = field(Code)));
            // FieldClass = FlowField;
        }
        field(47; "Total Procurement Cost"; Decimal)
        {
            CalcFormula = sum("Training Cost"."Line Amount" where("Training ID" = field(Code),
                                                                   "Cost Category" = filter(Procurable)));
            FieldClass = FlowField;
        }
        field(48; "Other Costs"; Decimal)
        {
            CalcFormula = sum("Training Cost"."Line Amount" where("Training ID" = field(Code),
                                                                   "Cost Category" = filter("Other Costs")));
            FieldClass = FlowField;
        }
        field(49; "Service Provider Cost"; Decimal)
        {
        }
        field(50; "Memo No."; Code[30])
        {
        }
        field(51; "Evaluation Summary"; Blob)
        {
        }
        field(52; "Entry No."; Integer)
        {
        }
        field(53; "Training Venue Region Code"; Code[10])
        {
            NotBlank = true;
            // TableRelation = Location;
            TableRelation = "Work Type".Code;

            trigger OnValidate()
            var
                // Location: Record Location;
                WorkType: Record "Work Type";
            begin
                if WorkType.Get("Training Venue Region Code") then
                    "Training Venue Region" := WorkType.Description;

                if "Training Plan No." <> '' then
                    if "Course Title" <> '' then
                        fnSuggestParticipants();
            end;
        }
        field(54; "Training Venue Region"; Text[100])
        {

        }
        // field(55; "Global Dimension 1 Code"; Text[30])
        // {
        //     DataClassification = ToBeClassified;

        //     CaptionClass = '1,1,1';
        //     Caption = 'Global Dimension 1 Code';
        //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
        //                                                   Blocked = CONST(false));

        // }
        field(56; "Training Responsibility"; Text[50])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            FieldClass = FlowField;
        }
        field(57; Requestor; Text[50])
        {
        }
        field(58; "Funding Source"; Option)
        {
            OptionMembers = Internal,Self,Government,Other;
        }
        field(59; Bonded; Boolean)
        {
        }
        field(60; "Bonding Period"; DateFormula)
        {
        }
        field(61; "Expected Bond Start"; Date)
        {
        }
        field(62; "Expected Bond End"; Date)
        {
        }
        field(63; "Bond Penalty"; Decimal)
        {
        }
        field(64; "Training Region"; Option)
        {
            OptionMembers = Local,Overseas;
        }
        field(65; "Duration Type"; Option)
        {
            OptionMembers = "Short Course","Long Course";
            Editable = false;

        }
        field(66; Purpose; Text[250])
        {
        }
        field(67; "Training Time"; Option)
        {
            OptionMembers = " ","working hours",weekends,"evening classes";
            OptionCaption = ' ,working hours,weekends,evening classes';
        }
        field(68; "Training Types"; Option)
        {
            OptionMembers = " ",Webinar,Workshop,hybrid;
        }
        field(69; "Training Category"; Option)
        {
            OptionMembers = "Full Time","Part Time";
        }


    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        if Status <> Status::Open then
            Error(mcontent);
    end;

    trigger OnInsert()
    begin
        if Code = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Training Application Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Training Application Nos.", xRec."No. Series", 0D, Code, "No. Series");
        end;
        "Created By" := UserId;
        "Created On" := Today;
        //GET THE REQUESTOR DETAILS
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            "Employee Name" := UserSetup."Employee Name";
            "Employee No." := UserSetup."Employee No.";
            Validate("Employee No.");
            if HREmp.Get(UserSetup."Employee No.") then begin
                "Employee Department" := HREmp."Department Code";
                "Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
                "Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
                //"Employee Name":=HREmp.FullName;

            end;

        end;


        /*HRSetup.GET();
        "Training Plan No.":=HRSetup."Annual Training Plan";*/

        HRSetup.Get;
        // "Training Plan No." := HRSetup."Annual Training Plan";

    end;

    var
        PlanningLineEntry: Record "Planning Line Entry";
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        mcontent: label 'Status must be new on Training Application No.';
        mcontent2: label '. Please cancel the approval request and try again';
        HREmp: Record Employee;
        Vend: Record Vendor;
        TrainingRequest: Record "Training Requests";
        TrainingPlanLines: Record "Training Plan Lines";
        UserSetup: Record "User Setup";
        TrainingParticipants: Record "Training Participants1";
        WorkType: Record "Work Type";

    procedure fnSuggestParticipants()
    var
        TPLines: Record "Training Plan Lines";
        TPStaffLines: Record "Training Plan Staff Lines";
        Participants: Record "Training Participants1";
    begin
        Participants.Reset();
        Participants.SetRange("Training Code", Code);
        if Participants.FindSet() then
            Participants.DeleteAll();

        TPStaffLines.Reset();
        TPStaffLines.SetRange("Training Plan Code", "Training Plan No.");
        TPStaffLines.SetRange("Course Title", "Course Title");
        TPStaffLines.SetRange(Destination, "Training Venue Region Code");
        if TPStaffLines.FindSet() then begin
            repeat
                Participants.Init();
                Participants."Training Code" := Code;
                Participants."Employee Code" := TPStaffLines."Employee Code";
                Participants.Validate("Employee Code");
                Participants.Type := TPStaffLines.Type;
                Participants.Destination := TPStaffLines.Destination;
                Participants."No. of Days" := TPStaffLines."No. of Days";
                Participants.Validate("No. of Days");
                Participants.Insert();
            until TPStaffLines.Next() = 0;
        end;
    end;
}

