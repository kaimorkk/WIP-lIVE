
table 52194113 "HR Leave Planner Header"
{
    DataClassification = CustomerContent;
    // DrillDownPageID = UnknownPage39005556;
    // LookupPageID = UnknownPage39005556;

    fields
    {
        field(1; "Application Code"; Code[20])
        {

            trigger OnValidate()
            begin
                //TEST IF MANUAL NOs ARE ALLOWED
                if "Application Code" <> xRec."Application Code" then begin
                    HRSetup.Get;
                    NoSeriesMgt.TestManual(HRSetup."Leave Planner Nos.");
                    "No series" := '';
                end;
            end;
        }
        field(2; Status; Option)
        {
            Editable = false;
            OptionCaption = 'New,Pending Approval,HOD Approval,HR Approval,Final Approval,Rejected,Canceled,Approved,On leave,Resumed,Posted';
            OptionMembers = New,"Pending Approval","HOD Approval","HR Approval",MDApproval,Rejected,Canceled,Approved,"On leave",Resumed,Posted;
        }
        field(3; "No series"; Code[30])
        {
        }
        field(4; Picture; Blob)
        {
        }
        field(5; Names; Text[100])
        {
        }
        field(6; "Supervisor Email"; Text[50])
        {
        }
        field(7; "Job Tittle"; Text[50])
        {
        }
        field(8; "User ID"; Code[50])
        {
        }
        field(9; "Employee No"; Code[20])
        {
            TableRelation = Employee;
            trigger OnValidate()
            begin
                HREmp.Reset;
                HREmp.SetRange(HREmp."No.", "Employee No");
                if HREmp.Find('-') then begin
                    "Employee No" := HREmp."No.";
                    Names := HREmp.FullName;
                    "Job Tittle" := HREmp."Job Title";
                    HREmp.Get(HREmp."No.");
                    "Responsibility Center" := HREmp."Directorate Code";
                    "Implementing Unit Name" := HREmp."Implementing Unit Name";

                    // HREmp.CalcFields(HREmp.Picture);
                    // Picture := HREmp.Picture;
                    "User ID" := HREmp."User ID";

                    UserSetup.Reset;
                    if UserSetup.Get(HREmp."User ID") then begin
                        UserSetup.TestField(UserSetup."Approver ID");
                        Supervisor := UserSetup."Approver ID";
                        UserSetup.Reset;
                        if UserSetup.Get(Supervisor) then
                            "Supervisor Email" := UserSetup."E-Mail";
                    end;
                end;

            end;
        }
        field(10; Supervisor; Code[20])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(11; "Responsibility Center"; Code[10])
        {
            Caption = 'Implementing Unit';
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate | "Court Stations" | "Department/Center" | "Division/Section" | Office));
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                /*
                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.",1);
                DimVal.SETRANGE(DimVal.Code,"Global Dimension 1 Code");
                 IF DimVal.FIND('-') THEN
                    "Function Name":=DimVal.Name;
                 UpdateLines;
                 */

            end;
        }
        field(14; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin

                /*DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code,"Shortcut Dimension 2 Code");
                 IF DimVal.FIND('-') THEN
                    "Budget Center Name":=DimVal.Name ;
                UpdateLines
                */

            end;
        }
        field(15; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                /*
                DimVal.RESET;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code,"Shortcut Dimension 3 Code");
                 IF DimVal.FIND('-') THEN
                    Dim3:=DimVal.Name
                */

            end;
        }
        field(16; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                /*
                DimVal.RESET;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code,"Shortcut Dimension 4 Code");
                 IF DimVal.FIND('-') THEN
                    Dim4:=DimVal.Name
                  */

            end;
        }
        field(17; "Job Description"; Text[100])
        {
        }
        field(18; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Payment Voucher,Petty Cash,Imprest,Requisition,ImprestSurrender,Interbank,Receipt,Staff Claim,Staff Advance,AdvanceSurrender,Store Requisition,Employee Requisition,Leave Application,Transport Requisition,Training Requisition,Job Approval,Induction Approval,Disciplinary Approvals,Activity Approval,Exit Approval,Medical Claim Approval,Jv,BackToOffice ,Training Needs,EmpTransfer,LeavePlanner';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Disciplinary Approvals","Activity Approval","Exit Approval","Medical Claim Approval",Jv,"BackToOffice ","Training Needs",EmpTransfer,LeavePlanner;
        }
        field(19; "Leave Calendar"; Code[20])
        {
            TableRelation = "HR Leave Periods".Code where(Closed = filter(false));
            trigger OnValidate()
            begin
                PlanHeader.Reset();
                PlanHeader.SetRange(PlanHeader."Leave Calendar", "Leave Calendar");
                PlanHeader.SetRange(PlanHeader."Responsibility Center", "Responsibility Center");
                if PlanHeader.find('-') then
                    Error('There already exists a plan for your Admin Unit for this leave period, Kindly utilise it');

            end;
        }
        field(20; "Implementing Unit Name"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Application Code", "Responsibility Center", "Leave Calendar")
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
        if "Application Code" = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Leave Planner Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Leave Planner Nos.", xRec."No series", 0D, "Application Code", "No series");
        end;

        //GET APPLICANT DETAILS FROM HR EMPLOYEES TABLE AND COPY THEM TO THE LEAVE APPLICATION TABLE
        // HREmp.Reset;
        // HREmp.SetRange(HREmp."User ID", UserId);
        // if HREmp.Find('-') then begin
        //     "Employee No" := HREmp."No.";
        //     Names := HREmp.FullName;
        //     "Job Tittle" := HREmp."Job Title";
        //     HREmp.Get(HREmp."No.");
        //     // HREmp.CalcFields(HREmp.Picture);
        //     // Picture := HREmp.Picture;
        //     "User ID" := UserId;
        // end else begin
        //     Error('User id' + ' ' + '[' + UserId + ']' + ' has not been assigned to any employee. Please consult the HR officer for assistance')
        // end;
        //GET LEAVE APPROVER DETAILS FROM USER SETUP TABLE COPY THEM TO THE LEAVE APPLICATION TABLE
        // UserSetup.Reset;
        // if UserSetup.Get(UserId) then begin
        //     UserSetup.TestField(UserSetup."Approver ID");
        //     Supervisor := UserSetup."Approver ID";
        //     UserSetup.Reset;
        //     if UserSetup.Get(Supervisor) then
        //         "Supervisor Email" := UserSetup."E-Mail";
        // end;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        HREmp: Record Employee;
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        SMTP: Codeunit "Email Message";
        LeaveGjline: Record "HR Journal Line";
        "LineNo.": Integer;
        ApprovalComments: Record "Approval Comment Line";
        URL: Text[500];
        sDate: Record Date;
        Customized: Record "Base Calendar";
        HREmailParameters: Record "Hr E-Mail Parameters";
        HRLeavePeriods: Record "HR Leave Periods";
        HRJournalBatch: Record "HR Leave Journal Batch";
        DimVal: Record "Dimension Value";
        PlanHeader: Record "HR Leave Planner Header";
        TEXT001: label 'Days Approved cannot be more than applied days';


    procedure NotifyApplicant()
    begin
        HREmp.Get("Employee No");
        HREmp.TestField(HREmp."Company E-Mail");

        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        HREmailParameters.Reset;
        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."associate with"::General);
        if HREmailParameters.Find('-') then begin


            HREmp.TestField(HREmp."Company E-Mail");
            //SMTP.Create(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HREmp."Company E-Mail",
            // HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
            // HREmailParameters.Body + ' ' + "Application Code" + ' ' + HREmailParameters."Body 2", true);
            // //SMTP.Send();


            Message('Leave applicant has been notified successfully');
        end;
    end;
}

