Page 52194145 "Appraiser and Appraisee Narrat"
{
    AutoSplitKey = false;
    PageType = ListPart;
    SourceTable = "Appraisal Lines1";
    SourceTableView = where("Appraisal Heading Type" = filter("Annual Appraisal" | "Mid-year Appraisal" | " "));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        DescriptionOnFormat;
    end;

    var
        AppraisalTypes: Record "Appraisal Types1";

        DescriptionEmphasize: Boolean;

    local procedure DescriptionOnFormat()
    begin
        if Bold then
            DescriptionEmphasize := true;
    end;
}

