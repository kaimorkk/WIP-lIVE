report 96000 "Application For Registration"
{
    Caption = 'Application For Registration and Licensing';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Application For Registration.rdlc';

    dataset
    {
        dataitem("Licensing Portal Users"; "Licensing Portal Users")
        {
            // DataItemLink = "User ID" = field("User ID");
            // DataItemLinkReference = LicenceRegistrationForm;
            // DataItemTableView = sorting("User ID");
            RequestFilterFields = "User ID";

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
            column(Full_Name; "Full Name")
            {
            }
            column(Street; Street)
            {
            }
            column(Building; Building)
            {
            }
            column(Postal_Address; "Postal Address")
            {
            }
            column(Postal_Code; "Postal Code")
            {
            }
            column(Town; Town)
            {
            }
            column(Phone_No_; "Phone No.")
            {
            }
            column(E_Mail; "E-Mail")
            {
            }
            column(Nationality; Nationality)
            {
            }
            column(Has_Bankruptcy_Conviction; "Has Bankruptcy/Conviction")
            {
            }
            column(Bankruptcy_Conviction_Details; "Bankruptcy/Conviction Details")
            {
            }
            dataitem("Licence Reg. Education Info"; "Licence Reg. Education Info")
            {
                DataItemLink = "Document No." = field("User ID");
                DataItemLinkReference = "Licensing Portal Users";
                DataItemTableView = sorting("Document No.", "Line No.");

                column(Education_Level; "Education Level")
                {
                }
                column(Qualification; Qualification)
                {
                }
                column(Institution; Institution)
                {
                }
                column(Course; Course)
                {
                }
                column(Other_Education_Level; "Other Education Level")
                {
                }
                column(Other_Qualification; "Other Qualification")
                {
                }
                column(Line_No_Education;"Line No.")
                {
                }
            }
            dataitem("Professional Inst. Membership"; "Professional Inst. Membership")
            {
                DataItemLink = "Document No." = field("User ID");
                DataItemLinkReference = "Licensing Portal Users";
                DataItemTableView = sorting("Document No.", "Line No.");

                column(Membership_Name; "Membership Name")
                {
                }
                column(Membership_Number; "Membership Number")
                {
                }
                column(Registration_Date; "Registration Date")
                {
                }
                column(Licence_Number; "Licence Number")
                {
                }
                column(Annual_Licence_Date; "Annual Licence Date")
                {
                }
                column(Line_No_Membership;"Line No.")
                {
                }
            }
            dataitem("Licence Reg. Employment Hist"; "Licence Reg. Employment Hist")
            {
                DataItemLink = "Document No." = field("User ID");
                DataItemLinkReference = "Licensing Portal Users";
                DataItemTableView = sorting("Document No.", "Line No.");

                column(Employer; Employer)
                {
                }
                column(Designation; Designation)
                {
                }
                column(Start_Date; "Start Date")
                {
                }
                column(End_Date; "End Date")
                {
                }
                column(Currently_Work_Here; "Currently Work Here")
                {
                }
                column(Employment_Type; "Employment Type")
                {
                }
                column(Line_No_Employment;"Line No.")
                {
                }
            }

            dataitem("Licence Reg. Practice Agencies"; "Licence Reg. Practice Agencies")
            {
                DataItemLink = "Document No." = field("User ID");
                DataItemLinkReference = "Licensing Portal Users";
                DataItemTableView = sorting("Document No.", "Line No.");

                column(Agency_Name; "Agency Name")
                {
                }
                column(Firm_No_; "Firm No.")
                {
                }
                column(Agency_Designation; Designation)
                {
                }
                column(Agency_Registration_No_; "Agency Registration No.")
                {
                }
                column(Firm_Licence_No_; "Firm Licence No.")
                {
                }
                column(Firm_Annual_Licence_No_; "Firm Annual Licence No.")
                {
                }
                column(Line_No_Agency;"Line No.")
                {
                }
            }
            dataitem("Licence Reg Proc Professionals"; "Licence Reg Proc Professionals")
            {
                DataItemLink = "Document No." = field("User ID");
                DataItemLinkReference = "Licensing Portal Users";
                DataItemTableView = sorting("Document No.", "Line No.");

                column(Name_Proc_Professionals; Name)
                {
                }
                column(Address_Proc_Professionals; Address)
                {
                }
                column(Phone_No_Proc_Professionals; "Phone No.")
                {
                }
                column(Profession_Proc_Professionals; Profession)
                {
                }
                column(E_Mail_Proc_Professionals; "E-Mail")
                {
                }
                column(Line_No_Proc_Professionals;"Line No.")
                {
                }
            }
            dataitem("Licence Reg. Pract. Categories"; "Licence Reg. Pract. Categories")
            {
                DataItemLink = "Document No." = field("User ID");
                DataItemLinkReference = "Licensing Portal Users";
                DataItemTableView = sorting("Document No.", "Line No.") where(Selected = filter(true), Approve = filter(false), Deregistered = filter(false));

                column(Practice_Category_Code; "Practice Category Code")
                {
                }
                column(Practice_Category_Name; "Practice Category Name")
                {
                }
                column(Practice_Fee; "Practice Fee")
                {
                }
                column(SerialNo; SerialNo)
                {
                }
                column(Line_No_Practice_Category;"Line No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    SerialNo := SerialNo + 1;
                end;
            }
            dataitem(LicenceRegistrationForm; "Licence Registration Form")
            {
                // RequestFilterFields = "No.", "User ID";
                DataItemLink = "User ID" = field("User ID");
                DataItemTableView = sorting("No.", "User ID") where("Application Type" = filter(Registration));

                column(No; "No.")
                {
                }
                column(DocumentDate; "Document Date")
                {
                }
                column(RegistrationDate; "Registration Date")
                {
                }
                column(SubmissionDate; "Submission Date")
                {
                }
                column(UserID; "User ID")
                {
                }
                column(ApplicationType; "Application Type")
                {
                }
                column(Status; Status)
                {
                }
                column(Amount; Amount)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                "Licensing Portal Users"."Full Name" := "Licensing Portal Users".FullName();
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
        SerialNo: Integer;
}
