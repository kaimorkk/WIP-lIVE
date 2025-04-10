
table 80255 "Innovation Evaluation Line"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Evaluation Comm";
        }
        field(2; "Invitation ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Solicitation"."Document No" where("Document Type" = const("Innovation Invitation"),
                                                                           Status = const(Released),
                                                                           Published = const(true));
        }
        field(3; "Idea ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Solicitation"."Document No" where("Document Type" = const("Idea Response"),
                                                                           Status = const(Released),
                                                                           "Portal Status" = const(Submitted));
        }
        field(4; "Idea Originator"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Name; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Innovation Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Category";
        }
        field(8; "Innovation Rating Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Rating Template";
        }
        field(9; "Overall Weighted Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Final Committee Decision"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Recommended for Implementation,Archived';
            OptionMembers = " ","Recommended for Implementation",Archived;
        }
        field(11; "Directorate ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(12; "Department ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(13; "Region ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Invitation ID", "Idea ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

