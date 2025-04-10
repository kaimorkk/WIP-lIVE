Table 52194077 "Goods Evaluations"
{
    DrillDownPageID = "Goods Evaluations";
    LookupPageID = "Goods Evaluations";

    fields
    {
        field(1;"Delivery No";Code[20])
        {
            TableRelation = "Purch. Rcpt. Header";
        }
        field(2;"Vendor No";Code[20])
        {
            TableRelation = Vendor;
        }
        field(3;"Item No";Code[20])
        {
            TableRelation = Item;
        }
        field(4;Criteria;Code[20])
        {
            TableRelation = "Goods Evaluation Criteria";

            trigger OnValidate()
            begin
                if CriteriaRec.Get(Criteria) then
                Description:=CriteriaRec."Evaluation Description";
            end;
        }
        field(5;Description;Text[150])
        {
        }
        field(6;Comments;Text[250])
        {
        }
        field(7;Score;Decimal)
        {

            trigger OnValidate()
            begin
                if CriteriaRec.Get(Criteria) then begin
                 if Score>CriteriaRec."Max Score" then
                  Error(Text000,CriteriaRec.FieldCaption("Max Score"),CriteriaRec."Max Score",CriteriaRec.Code);
                end;
            end;
        }
    }

    keys
    {
        key(Key1;"Delivery No","Vendor No","Item No",Criteria)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CriteriaRec: Record "Goods Evaluation Criteria";
        Text000: label 'The Score cannot be more than the %1 of %2 under %3';
}

