page 50447 "Headline Judiciary"
{
    Caption = 'Headline';
    PageType = HeadlinePart;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group(Control1)
            {
                ShowCaption = false;
                Visible = UserGreetingVisible;
                field(GreetingText; Greeting)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Greeting headline';
                    Editable = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin

        RCHeadlinesPageCommon.HeadlineOnOpenPage(Page::"Headline RC Accountant");
        Greeting := RCHeadlinesPageCommon.GetGreetingText();
        Employee.Reset();
        Employee.SetRange("User ID", UserId);
        if Employee.FindFirst() then begin
            DimVal.Reset();
            DimVal.SetRange("Global Dimension No.", 2);
            DimVal.SetRange(Code, Employee."Global Dimension 2 Code");
            if DimVal.FindFirst() then
                Greeting := RCHeadlinesPageCommon.GetGreetingText() + ' ,' + DimVal.Name;
        end;
        DefaultFieldsVisible := RCHeadlinesPageCommon.AreDefaultFieldsVisible();
        UserGreetingVisible := RCHeadlinesPageCommon.IsUserGreetingVisible();
    end;

    var
        RCHeadlinesPageCommon: Codeunit "RC Headlines Page Common";
        Greeting: Text;
        DimVal: Record "Dimension Value";
        Employee: Record Employee;
        [InDataSet]
        DefaultFieldsVisible: Boolean;
        [InDataSet]
        UserGreetingVisible: Boolean;
}
