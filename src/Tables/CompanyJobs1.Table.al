Table 52193883 "Company Jobs1"
{
    DrillDownPageID = "Company Job List";
    LookupPageID = "Company Job List";

    fields
    {
        field(1;"Job ID";Code[20])
        {
            NotBlank = true;
        }
        field(2;"Job Description";Text[250])
        {
        }
        field(3;"No of Posts";Integer)
        {

            trigger OnValidate()
            begin
                if "No of Posts" <> xRec."No of Posts" then
                 "Vacant Establishments" := "No of Posts" - "Occupied Establishments";
            end;
        }
        field(4;"Position Reporting to";Code[20])
        {
            TableRelation = "Company Jobs1"."Job ID";
        }
        field(5;"Occupied Establishments";Integer)
        {
            CalcFormula = count(Employee where (Position=field("Job ID"),
                                                Status=const(Active)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;"Vacant Establishments";Integer)
        {
        }
        field(7;"Score code";Code[20])
        {
            TableRelation = "Company Jobs1";
        }
        field(8;"Dimension 1";Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                 DimensionRec.Reset;
                 DimensionRec.SetRange(DimensionRec."Dimension Code",'DIRECTORATE');
                 DimensionRec.SetRange(DimensionRec.Code,"Dimension 1");
                 if DimensionRec.Find('-') then
                   "Directorate Name":=DimensionRec.Name;
            end;
        }
        field(9;"Dimension 2";Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                 DimensionRec.Reset;
                 DimensionRec.SetRange(DimensionRec."Dimension Code",'DEPARTMENT');
                 DimensionRec.SetRange(DimensionRec.Code,"Dimension 2");
                 if DimensionRec.Find('-') then
                   "Department Name":=DimensionRec.Name;
            end;
        }
        field(10;"Dimension 3";Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));
        }
        field(11;"Dimension 4";Code[20])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));
        }
        field(12;"Dimension 5";Code[20])
        {
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(5));
        }
        field(13;"Dimension 6";Code[20])
        {
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(6));
        }
        field(14;"Dimension 7";Code[20])
        {
            CaptionClass = '1,2,7';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(7));
        }
        field(15;"Dimension 8";Code[20])
        {
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(8));
        }
        field(16;"No of Position";Integer)
        {
        }
        field(17;"Total Score";Decimal)
        {
            CalcFormula = sum("Job Requirementx1"."Score ID" where ("Job Id"=field("Job ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18;"Stage filter";Integer)
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value";
        }
        field(19;Objective;Text[250])
        {
        }
        field(21;"Key Position";Boolean)
        {
        }
        field(22;Category;Code[20])
        {
        }
        field(23;Grade;Code[20])
        {
            TableRelation = "Salary Scales1";
        }
        field(24;"Primary Skills Category";Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(25;"2nd Skills Category";Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(26;"3nd Skills Category";Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(27;Management;Boolean)
        {
        }
        field(28;Variance;Integer)
        {
        }
        field(29;"Notice Period";DateFormula)
        {
        }
        field(30;"Probation Period";DateFormula)
        {
        }
        field(31;"Date Active";Date)
        {
        }
        field(32;"Structure Identifier";Code[20])
        {
            TableRelation = "Structure Identifier Tables";
        }
        field(33;"Directorate Name";Text[50])
        {
        }
        field(34;"Department Name";Text[50])
        {
        }
        field(35;Status;Option)
        {
            OptionCaption = 'Active,Inactive';
            OptionMembers = Active,Inactive;
        }
    }

    keys
    {
        key(Key1;"Job ID")
        {
            Clustered = true;
        }
        key(Key2;"Vacant Establishments")
        {
        }
        key(Key3;"Dimension 1")
        {
        }
        key(Key4;"Dimension 2")
        {
        }
        
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Job ID","Job Description","Dimension 1","Dimension 2")
        {
        }
    }

    var
        DimensionRec: Record "Dimension Value";
}

