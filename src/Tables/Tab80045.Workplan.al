
table 80045 "Workplan"
{
    Caption = 'Job';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Corporate Workplan,Operating Workplan,Individual Workplan,Corporate PC,Operating PC,Individual PC';
            OptionMembers = "Corporate Workplan","Operating Workplan","Individual Workplan","Corporate PC","Operating PC","Individual PC";
        }
        field(3; Description; Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Strategy Plan ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans";
        }
        field(5; "Annual Reporting Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes";
        }
        field(6; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Responsible Employee No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(9; Designation; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Employee Name"; Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Responsibility Center"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Responsibility Center Name"; Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(14; "Blocked?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, "Annual Reporting Code", "Approval Status")
        {
        }
        fieldgroup(Brick; "No.", Description, "Annual Reporting Code", "Approval Status")
        {
        }
    }

    trigger OnDelete()
    var
        CommentLine: Record "Comment Line";
        JobTask: Record "Job Task";
        JobResPrice: Record "Job Resource Price";
        JobItemPrice: Record "Job Item Price";
        JobGLAccPrice: Record "Job G/L Account Price";
    begin
    end;

    var
        AssociatedEntriesExistErr: label 'You cannot change %1 because one or more entries are associated with this %2.', Comment = '%1 = Name of field used in the error; %2 = The name of the Job table';
        JobsSetup: Record "Jobs Setup";
        PostCode: Record "Post Code";
        Job: Record Job;
        Cust: Record Customer;
        Cont: Record Contact;
        ContBusinessRelation: Record "Contact Business Relation";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        StatusChangeQst: label 'This will delete any unposted WIP entries for this job and allow you to reverse the completion postings for this job.\\Do you wish to continue?';
        ContactBusRelDiffCompErr: label 'Contact %1 %2 is related to a different company than customer %3.', Comment = '%1 = The contact number; %2 = The contact''s name; %3 = The Bill-To Customer Number associated with this job';
        ContactBusRelErr: label 'Contact %1 %2 is not related to customer %3.', Comment = '%1 = The contact number; %2 = The contact''s name; %3 = The Bill-To Customer Number associated with this job';
        ContactBusRelMissingErr: label 'Contact %1 %2 is not related to a customer.', Comment = '%1 = The contact number; %2 = The contact''s name';
        TestBlockedErr: label '%1 %2 must not be blocked with type %3.', Comment = '%1 = The Job table name; %2 = The Job number; %3 = The value of the Blocked field';
        ReverseCompletionEntriesMsg: label 'You must run the %1 function to reverse the completion entries that have already been posted for this job.', Comment = '%1 = The name of the Job Post WIP to G/L report';
        MoveEntries: Codeunit MoveEntries;
        OnlineMapMsg: label 'Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.';
        CheckDateErr: label '%1 must be equal to or earlier than %2.', Comment = '%1 = The job''s starting date; %2 = The job''s ending date';
        BlockedCustErr: label 'You cannot set %1 to %2, as this %3 has set %4 to %5.', Comment = '%1 = The Bill-to Customer No. field name; %2 = The job''s Bill-to Customer No. value; %3 = The Customer table name; %4 = The Blocked field name; %5 = The job''s customer''s Blocked value';
        ApplyUsageLinkErr: label 'A usage link cannot be enabled for the entire %1 because usage without the usage link already has been posted.', Comment = '%1 = The name of the Job table';
        WIPMethodQst: label 'Do you want to set the %1 on every %2 of type %3?', Comment = '%1 = The WIP Method field name; %2 = The name of the Job Task table; %3 = The current job task''s WIP Total type';
        WIPAlreadyPostedErr: label '%1 must be %2 because job WIP general ledger entries already were posted with this setting.', Comment = '%1 = The name of the WIP Posting Method field; %2 = The previous WIP Posting Method value of this job';
        WIPAlreadyAssociatedErr: label '%1 cannot be modified because the job has associated job WIP entries.', Comment = '%1 = The name of the WIP Posting Method field';
        WIPPostMethodErr: label 'The selected %1 requires the %2 to have %3 enabled.', Comment = '%1 = The name of the WIP Posting Method field; %2 = The name of the WIP Method field; %3 = The field caption represented by the value of this job''s WIP method';
        EndingDateChangedMsg: label '%1 is set to %2.', Comment = '%1 = The name of the Ending Date field; %2 = This job''s Ending Date value';
        UpdateJobTaskDimQst: label 'You have changed a dimension.\\Do you want to update the lines?';
        DocTxt: label 'Job Quote';
        RunWIPFunctionsQst: label 'You must run the %1 function to create completion entries for this job. \Do you want to run this function now?', Comment = '%1 = The name of the Job Calculate WIP report';
        FundOp: Record "Funding Oportunity";
        // GrantsSetup: Record "Grants Setup";
        // GFA: Record "Grant Funding Application";
        Res: Record Resource;

    procedure AssistEdit(): Boolean
    begin
    end;
}

