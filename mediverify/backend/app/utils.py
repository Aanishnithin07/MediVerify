from io import BytesIO
from PIL import Image


def load_image_from_bytes(image_bytes: bytes) -> Image.Image:
    """Load an image from raw bytes and convert to RGB."""
    image = Image.open(BytesIO(image_bytes))
    if image.mode != "RGB":
        image = image.convert("RGB")
    return image
