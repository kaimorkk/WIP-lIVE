
table 80241 "Related Policy"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
            TableRelation = Policy.Code;

            trigger OnValidate()
            begin
                /*IF (Type=Type::External) THEN BEGIN
                    IF Code <> xRec.Code THEN BEGIN
                       SPMSetup.GET;
                        NoSeriesMgt.TestManual(SPMSetup."External Policy No. Series");
                       "No. Series" := '';
                    END;
                END;
                
                IF (Type=Type::Internal) THEN BEGIN
                    IF Code <> xRec.Code THEN BEGIN
                       SPMSetup.GET;
                        NoSeriesMgt.TestManual(SPMSetup."Internal Policy No. Series");
                       "No. Series" := '';
                    END;
                END;*/


                if Policy.Get(Code) then begin
                    "Policy Name" := Policy."Policy Name";
                    Summary := Policy.Summary;
                end;

            end;
        }
        field(2; Type; Option)
        {
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
        field(3; "Policy Name"; Text[255])
        {
        }
        field(4; Summary; Text[255])
        {
        }
        field(5; "Applies-To"; Option)
        {
            OptionCaption = 'All Staff,Some Staff,Public,Other';
            OptionMembers = "All Staff","Some Staff",Public,Other;
        }
        field(6; "Responsibility Center"; Code[30])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(7; "Responsible Person"; Code[30])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Responsible Person") then begin
                    Name := Employee.FullName;
                    Title := Employee.Title;
                end;
            end;
        }
        field(8; Name; Text[100])
        {
        }
        field(9; Title; Text[50])
        {
        }
        field(10; "Date Approved"; Date)
        {
        }
        field(11; "Current Version No"; Integer)
        {
        }
        field(12; "Last Review Date"; Date)
        {
        }
        field(13; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(15; "Policy Dev Institution ID"; Code[30])
        {
            TableRelation = "Policy Development Institution".Code;
        }
        field(16; "Policy Goal"; Text[255])
        {
        }
        field(17; "External Ref No"; Code[30])
        {
        }
        field(18; "Policy Overview"; Text[300])
        {
        }
        field(19; "Policy Purpose"; Text[300])
        {
        }
        field(20; "Policy Rationale"; Text[300])
        {
        }
        field(21; "Policy Scope"; Text[255])
        {
        }
        field(22; "Primary Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(23; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(24; "Process Owner ID"; Code[30])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin

                if Employee.Get("Process Owner ID") then begin
                    "Process Owner Name" := Employee.FullName;
                end;
            end;
        }
        field(25; "Process Owner Name"; Text[100])
        {
        }
        field(26; "Process Owner Title"; Code[100])
        {
        }
        field(27; "Approved By"; Code[50])
        {
        }
        field(28; "Approver Name"; Code[50])
        {
        }
        field(29; "Policy Stage"; Option)
        {
            OptionCaption = 'Agenda Setting,Policy Formulation,Implementation,Obsolete';
            OptionMembers = "Agenda Setting","Policy Formulation",Implementation,Terminated;
        }
        field(30; "No. of Policy Revisions"; Decimal)
        {
        }
        field(31; "Employee Policy Attestations"; Decimal)
        {
        }
        field(32; "Policy Compliance Audits"; Decimal)
        {
        }
        field(33; "Created By"; Code[30])
        {
        }
        field(34; "Created Date"; Date)
        {
        }
        field(35; "Created Time"; Time)
        {
        }
        field(36; "Drafting Date"; Date)
        {
        }
        field(37; "Approval Date"; Date)
        {
        }
        field(38; "Last Revision Date"; Date)
        {
        }
        field(39; "Vision Statement"; Text[300])
        {
        }
        field(40; "Mission Statement"; Text[255])
        {
        }
        field(41; "Employee Attestation Due Date"; Date)
        {
        }
        field(42; "Main Policy"; Code[30])
        {
            TableRelation = Policy.Code;
        }
    }

    keys
    {
        key(Key1; "Main Policy", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*IF (Type=Type::External) THEN BEGIN
            IF Code = '' THEN BEGIN
              SPMSetup.GET;
              SPMSetup.TESTFIELD("External Policy No. Series");
              NoSeriesMgt.InitSeries(SPMSetup."External Policy No. Series",xRec."No. Series",0D,Code,"No. Series");
            END;
        END;
        
        IF (Type=Type::Internal) THEN BEGIN
            IF Code = '' THEN BEGIN
              SPMSetup.GET;
              SPMSetup.TESTFIELD("Internal Policy No. Series");
              NoSeriesMgt.InitSeries(SPMSetup."Internal Policy No. Series",xRec."No. Series",0D,Code,"No. Series");
            END;
        END;
        "Created By":=USERID;
         "Created Date":=TODAY;
        "Created Time":=TIME;*/

    end;

    var
        SPMSetup: Record "Policy Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        Policy: Record Policy;
}

