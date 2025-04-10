
table 70187 "Supplier Rating Score Guide"
{
    LookupPageID = "Supplier Rating Score Guide";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Appraisal Template ID"; Code[30])
        {
            TableRelation = "Supplier Rating Template";
        }
        field(2; "Template Type"; Option)
        {
            OptionCaption = 'Vendor Due Diligence,Supplier Performance Review';
            OptionMembers = "Vendor Due Diligence","Supplier Performance Review";
        }
        field(3; "Criteria Group"; Code[30])
        {
        }
        field(4; "Checklist ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Entry No"; Integer)
        {
        }
        field(6; "Target Qty"; Decimal)
        {
        }
        field(7; "Rating Type"; Option)
        {
            OptionCaption = 'Number,Yes/No,Options Text,Date';
            OptionMembers = Number,"Yes/No","Options Text",Date;
        }
        field(9; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(10; "Response Value"; Code[50])
        {
        }
        field(11; "Min Bid Value"; Decimal)
        {
        }
        field(12; "Max Bid Value"; Decimal)
        {
        }
        field(13; "Min Date Value"; Date)
        {
        }
        field(14; "Max Date Value"; Date)
        {
        }
        field(15; "Score %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Appraisal Template ID", "Template Type", "Criteria Group", "Checklist ID", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

