from pydantic import BaseModel, ConfigDict, Field


class LanguageRead(BaseModel):
    """ISO-639-1 language catalog entry."""
    code: str = Field(..., max_length=8, description="ISO-639-1 two-letter code")
    name: str = Field(..., max_length=64, description="English language name")
    native_name: str = Field(..., max_length=64, description="Autonym/native language name")
    model_config = ConfigDict(from_attributes=True)
