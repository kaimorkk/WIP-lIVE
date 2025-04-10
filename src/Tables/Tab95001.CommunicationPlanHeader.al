
table 95001 "Communication Plan Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Corporate,Functional,Project';
            OptionMembers = " ",Corporate,Functional,Project;
        }
        field(2; "Document No"; Code[20])
        {
            Editable = false;
        }
        field(3; "Project ID"; Code[20])
        {
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.", "Project ID");
                if ObjJob.FindSet then begin
                    "Project Name" := ObjJob.Description;
                    "Project Start Date" := ObjJob."Starting Date";
                    "Project End Date" := ObjJob."Ending Date";
                end;
            end;
        }
        field(4; "Work Execution Plan ID"; Code[20])
        {
            //  TableRelation = Table72157.Field2 where (Field1=filter(2));
        }
        field(5; Description; Text[250])
        {
        }
        field(6; "Primary MIssion"; Text[250])
        {
        }
        field(7; "Project Name"; Text[250])
        {
            Editable = false;
        }
        field(8; "Project Start Date"; Date)
        {
            Editable = false;
        }
        field(9; "Project End Date"; Date)
        {
            Editable = false;
        }
        field(10; "No. Of Planned Meetings"; Integer)
        {
            Description = 'Fred Calcfieds later';
        }
        field(11; "No. Of Meetings Held"; Integer)
        {
            Description = 'Fred Calcfieds later';
        }
        field(12; "No. Of Project Report"; Integer)
        {
            Description = 'Fred Calcfieds later';
        }
        field(13; Blocked; Boolean)
        {
        }
        field(14; Status; Option)
        {
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(15; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(16; "Created Date Time"; DateTime)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ObjJob: Record Job;
}

