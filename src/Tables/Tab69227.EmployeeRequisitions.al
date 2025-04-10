
table 69227 "Employee Requisitions"
{
    DrillDownPageID = "Employee Requisitions List";
    LookupPageID = "Employee Requisitions List";
    DataClassification = CustomerContent;

    fields
    {
        field(2; "Job ID"; Code[20])
        {
            NotBlank = true;
            TableRelation = "ManPower Planning Lines"."Entry No";

            // trigger OnValidate()
            // begin
            //     HRJobs.Reset;
            //     if HRJobs.Get("Job ID") then begin
            //       "Job Title":=HRJobs."Task No";
            //       "Job Grade":=HRJobs.Grade;
            //       "Job Supervisor/Manager":=HRJobs."Supervisor/Manager";
            //        "Global Dimension 2 Code":=HRJobs."Quarter 1 Target";
            //        end;
            //      CompanyJobsDimensions.Reset;
            //      CompanyJobsDimensions.SetRange(Code,"Job ID");
            //      CompanyJobsDimensions.SetRange("Dimension Code","Responsibility Center");
            //      if CompanyJobsDimensions.FindSet then begin
            //       "Vacant Positions":=CompanyJobsDimensions."Vacant Positions";

            //       end else begin
            //       "Vacant Positions":=0;
            //       end;
            // end;
        }
        field(3; "Requisition Date"; Date)
        {

            trigger OnValidate()
            begin
                if (Rec."Requisition Date" - Today) < 0 then
                    Message('Days in the past are not allowed');
            end;
        }
        field(4; Priority; Option)
        {
            OptionCaption = 'High,Medium,Low';
            OptionMembers = High,Medium,Low;
        }
        field(5; Positions; Integer)
        {
        }
        field(6; Approved; Boolean)
        {

            trigger OnValidate()
            begin
                "Date Approved" := Today;
            end;
        }
        field(7; "Date Approved"; Date)
        {
        }
        field(8; "Job Description"; Text[300])
        {
        }
        field(9; Stage; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(10; Score; Decimal)
        {
            FieldClass = Normal;
        }
        field(11; "Stage Code"; Code[20])
        {
        }
        field(12; Qualified; Boolean)
        {
            FieldClass = Normal;
        }
        field(13; "Job Supervisor/Manager"; Code[20])
        {
        }
        field(14; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(15; "Job Title"; Text[100])
        {
        }
        field(17; "Turn Around Time"; Integer)
        {
            Editable = false;
        }
        field(21; "Grace Period"; Integer)
        {
        }
        field(25; Closed; Boolean)
        {
            Editable = false;
        }
        field(26; "Requisition Type"; Option)
        {
            OptionCaption = ' ,Internal,External,Both';
            OptionMembers = " ",Internal,External,Both;
        }
        field(27; "Closing Date"; Date)
        {
        }
        field(28; Status; Option)
        {
            Editable = false;
            OptionCaption = 'New,Pending Approval,Approved';
            OptionMembers = New,"Pending Approval",Approved;
        }
        field(38; "Required Positions"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Required Positions" > "Vacant Positions" then begin
                    Error('Required positions exceed the total  no of Vacant Positions');
                end;

                if "Required Positions" <= 0 then begin
                    Error('Required positions cannot be Less Than or Equal to Zero');
                end;
            end;
        }
        field(39; "Vacant Positions"; Decimal)
        {
            Editable = true;
        }
        field(3949; "Reason for Request(Other)"; Text[100])
        {
        }
        field(3950; "Any Additional Information"; Text[100])
        {
        }
        field(3958; "Job Grade"; Text[100])
        {
            Editable = false;
        }
        field(3964; "Type of Contract Required"; Code[20])
        {
        }
        field(3965; "Reason For Request"; Option)
        {
            OptionMembers = "New Vacancy",Replacement,Retirement,Retrenchment,Demise,Other;
        }
        field(3966; Requestor; Code[50])
        {
            Editable = false;
        }
        field(3967; "No. Series"; Code[10])
        {
        }
        field(3968; "Requisition No."; Code[20])
        {
        }
        field(3969; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(3970; "Shortlisting Comittee"; Code[20])
        {
        }
        field(3972; "Closed Application"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Requisition No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Job ID", "Job Title", "Requisition No.")
        {
        }
    }

    trigger OnDelete()
    begin
        /*
        IF Status<>Status::New THEN
        ERROR('You cannot delete this record if its status is'+' '+FORMAT(Status));
        */

    end;

    trigger OnInsert()
    begin
        //GENERATE DOCUMENT NUMBER
        if "Requisition No." = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Employee Requisition Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Employee Requisition Nos.", xRec."No. Series", 0D, "Requisition No.", "No. Series");
        end;

        userSetup.Reset;
        userSetup.SetRange(userSetup."User ID", UserId);
        if userSetup.Find('-') then begin
            mDivision := userSetup."Shortcut Dimension 2 Code";
            mResponsibility := userSetup."Responsibility Center";
        end;

        //POPULATE FIELDS
        Requestor := UserId;
        "Requisition Date" := Today;
        "Responsibility Center" := mResponsibility;
        "Global Dimension 2 Code" := mDivision;
    end;

    trigger OnModify()
    begin
        userSetup.Reset;
        userSetup.SetRange(userSetup."User ID", UserId);
        if userSetup.Find('-') then begin
            // mDivision := userSetup."Global Dimension 1 Code";
        end;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRJobs: Record "ManPower Planning Lines";
        HREmployeeReq: Record "Employee Requisitions";
        userSetup: Record "User Setup";
        mDivision: Code[50];
        mResponsibility: Code[50];
        CompanyJobsDimensions: Record "Attainment Table Setup";
}

