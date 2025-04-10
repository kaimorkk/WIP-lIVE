Page 52194124 "Appraiser and Appraisee Comm"
{
    AutoSplitKey = false;
    PageType = ListPart;
    SourceTable = "Appraisal Lines1";
    SourceTableView = where("Appraisal Heading Type" = filter("Core Values" | "Technical Competencies" | "Behavioural Competencies"));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AppraisersComments; "Appraiser's Comments")
                {
                    ApplicationArea = Basic;
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

