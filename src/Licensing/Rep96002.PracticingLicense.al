report 96002 "Practicing License"
{
    // ApplicationArea = All;
    // UsageCategory = ReportsAndAnalysis;
    Caption = 'Practicing License';
    DefaultRenderingLayout = "PracticingLicense.rdlc";
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(Licences; Licences)
        {
            RequestFilterFields = "Licence ID";

            column(logo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyName2; CompanyInfo."Name 2")
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyHeadName; CompanyHeadName)
            {
            }
            column(CompanyHeadTitle; CompanyHeadTitle)
            {
            }
            column(LicenceID; "Licence ID")
            {
            }
            column(RegistrationNo; "Registration No.")
            {
            }
            column(UserID; "User ID")
            {
            }
            column(ApplicationID; "Application ID")
            {
            }
            column(CategoryID; "Category ID")
            {
            }
            column(CategoryName; "Category Name")
            {
            }
            column(LicenceStartDate; "Licence Start Date")
            {
            }
            column(LicenceExpiryDate; "Licence Expiry Date")
            {
            }
            column(Status; Status)
            {
            }
            column(IssueDate; "Issue Date")
            {
            }
            column(StartDateFormat; StartDateFormat)
            {
            }
            column(ExpDateFormat; ExpDateFormat)
            {
            }
            dataitem("Licensing Portal Users"; "Licensing Portal Users")
            {
                DataItemLink = "User ID" = field("User ID");
                DataItemLinkReference = Licences;
                DataItemTableView = sorting("User ID");

                column(Full_Name; "Full Name")
                {
                }
                column(E_Mail; "E-Mail")
                {
                }
                column(Phone_No_; "Phone No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Licensing Portal Users"."Full Name" := "Licensing Portal Users".FullName();
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ExpDateFormat := Format(Licences."Licence Expiry Date");
                StartDateFormat := Format(Licences."Licence Start Date");
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    rendering
    {
        layout("PracticingLicense.rdlc")
        {
            Type = RDLC;
            LayoutFile = './Layouts/Practicing License.rdlc';
            Caption = 'Practicing License (RDLC)';
        }
        // layout("PracticingLicense.docx")
        // {
        //     Type = Word;
        //     LayoutFile = './Layouts/Practicing License.docx';
        //     Caption = 'Practicing License (Word)';
        // }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);

        Emp.Reset();
        Emp.SetRange("No.", CompanyInfo."Company Head");
        if Emp.FindFirst() then begin
            CompanyHeadName := Emp.FullName();
            CompanyHeadTitle := Emp."Job Title";
        end;
    end;

    var
        CompanyInfo: Record "Company Information";
        Emp: Record Employee;
        CompanyHeadName: Text;
        CompanyHeadTitle: Text;
        StartDateFormat: Text;
        ExpDateFormat: Text;
}
